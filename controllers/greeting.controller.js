const greetings = [
  { greeting: "Hello" },
  { greeting: "Hi" },
  { greeting: "Howdy" },
];
exports.getGreeting = (req, res) => {
  return res.status(200).json(greetings);
};
