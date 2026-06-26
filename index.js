function add(a, b) {
  return a + b;
}

function main() {
  const result = add(2, 3);
  console.log(`2 + 3 = ${result}`);
}

if (require.main === module) {
  main();
}

module.exports = {
  add
};
