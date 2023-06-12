const { ethers } = require("ethers");
const { MerkleTree } = require("merkletreejs");
const { keccak256 } = ethers.utils;

// 2. Documents
const documents = [
  "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
  "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2"
];

// 3. Creating a buffer since we bytes array
const padBuffer = (docHash) => {
  return Buffer.from(docHash.substr(2).padStart(32 * 2, 0), "hex");
};

// 4. Creating buffer from leaves (lowest points in tree)
const leaves = documents.map((docHash) => padBuffer(docHash));
const tree = new MerkleTree(leaves, keccak256, { sort: true });

// 5. Creating a merkleRoot that we'll inject into smart contract
const merkleRoot = tree.getHexRoot();
console.log(merkleRoot)

// 6. Calculating merkleProof to check if an address is whitelisted
const merkleProof = tree.getHexProof(padBuffer(documents[0]));
console.log(merkleProof)


