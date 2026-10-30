export function authorizeModification(req, res, next) {
  if (!req.user) {
    return res.status(401).json({ error: "Access denied" });
  }

  const { role, id } = req.user;
  const targetUserId = req.params.userId;
  if (role !== "parent" && (role !== "child" || String(targetUserId) !== String(id))) {
    return res.status(403).json({ error: "Access denied" });
  }

  next();
}