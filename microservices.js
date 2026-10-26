import express from "express";
import cors from "cors";

const app = express();

app.use(cors({ optionsSuccessStatus: 200 }));

app.use(express.static("public"));

app.get("/", (_req, res) => {
  res.sendFile(import.meta.dirname + "/views/index.html");
});

// Do not change code above this line
app.get("/api", (req, res) => {
  const dateObj = new Date();
  res.json({
    unix: dateObj.getTime(),
    utc: dateObj.toUTCString()
  });
});
app.get("/api/:date", (req, res) => {
  const inputDate = req.params.date;
  let dateObj;

  if (!isNaN(inputDate)) {
    dateObj = new Date(parseInt(inputDate));
  } else {
    dateObj = new Date(inputDate);
  }

  if (isNaN(dateObj.getTime())) {
    return res.json({ error: "Invalid Date" });
  }

  res.json({
    unix: dateObj.getTime(),
    utc: dateObj.toUTCString()
  });
});
// Do not change code below this line

const PORT = 8000;
const listener = app.listen(PORT, function () {
  console.log("Your app is listening on port " + listener.address().port);
});
