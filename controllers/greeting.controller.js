const fs = require("fs").promises;
const path = require("path");

const dataDir = path.join(__dirname, "..", "data");
const greetingsPath = path.join(dataDir, "greetings.json");

exports.getGreeting = async (req, res) => {
  try {
    const data = await fs.readFile(greetingsPath, "utf8");
    const greetings = JSON.parse(data);
    return res.status(200).json(greetings);
  } catch (error) {
    if (error.code === "ENOENT") {
      return res.status(500).json({ error: "Greetings data file not found" });
    }
    return res.status(500).json({
      error:
        error instanceof SyntaxError
          ? "Invalid JSON format"
          : "Failed to read data",
    });
  }
};
