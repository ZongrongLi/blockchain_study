// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Mercle {
	bytes32[] public transactions;
	bytes32[] public hashes;
	function setTransaction(bytes32[] memory  _transactions) public {
		transactions = _transactions;
	}

	function getRoot() public view returns (bytes32) {
		return transactions[transactions.length-1];
	}

	function calc()  public returns (bytes32) {
		if (transactions.length == 1) {
			return transactions[0];
		}



        for (uint i = 0; i < transactions.length; i++) {
            hashes.push(keccak256(
                abi.encodePacked(transactions[i])
            ));
        }

		uint levelSize = transactions.length;
        uint levelOffset =0;
		while(levelSize>1){
            for (uint i = 0; i < levelSize; i+=2) {
                uint left = levelOffset +i;
                uint right = levelOffset + i+1;
                hashes.push(keccak256(abi.encodePacked(hashes[left],hashes[right])));
            }
            levelOffset += levelSize;
			levelSize = (levelSize+1)/2;
		}
		return hashes[hashes.length-1];
	}


     function verify(
        bytes32[] memory proof,
        bytes32 root,
        bytes32 leaf,
        uint index
    ) public pure returns (bool) {
        bytes32 hash = leaf;

        for (uint i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];

            if (index % 2 == 0) {
                hash = keccak256(abi.encodePacked(hash, proofElement));
            } else {
                hash = keccak256(abi.encodePacked(proofElement, hash));
            }

            index = index / 2;
        }

        return hash == root;
    }
}

