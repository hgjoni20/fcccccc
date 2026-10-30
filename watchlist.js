import express from "express";
import { authenticate } from "../middleware/authenticate.js";
import { authorizeModification } from "../middleware/authorize.js";
import { 
  getWatchlist, 
  addMovie, 
  updateMovie, 
  deleteMovie 
} from "../utils/db.js";

const router = express.Router();

router.get("/:userId", authenticate, (req, res) => {
  const { userId } = req.params;
  const watchlist = getWatchlist(userId);
  
  if (watchlist === null) {
    return res.status(404).json({ error: "User not found" });
  }

  return res.status(200).json(watchlist);
});


router.post("/:userId/movies", authenticate, authorizeModification, (req, res) => {
  const { userId } = req.params;
  const movie = addMovie(userId, req.body);

  if (!movie) {
    return res.status(404).json({ error: "User not found" });
  }

  return res.status(201).json(movie);
});

router.put("/:userId/movies/:movieId", authenticate, authorizeModification, (req, res) => {
  const { userId, movieId } = req.params;
  const updatedMovie = updateMovie(userId, Number(movieId), req.body);

  if (!updatedMovie) {
    return res.status(404).json({ error: "Movie or user not found" });
  }

  return res.status(200).json(updatedMovie);
});

router.delete("/:userId/movies/:movieId", authenticate, authorizeModification, (req, res) => {
  const { userId, movieId } = req.params;
  const success = deleteMovie(userId, Number(movieId));

  if (!success) {
    return res.status(404).json({ error: "Movie or user not found" });
  }

  return res.status(200).json({ message: "Movie deleted successfully" });
});

export default router;