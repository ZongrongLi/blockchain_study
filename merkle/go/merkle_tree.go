package main

import (
	"example.com/m/v2/utils"
)

func CalculateMerkleTreeRoot(transactions [][]byte) []byte {
	result := transactions
	levelOffset := 0
	levelSize := len(transactions)
	for {
		// fmt.Println("==>>:", levelSize)
		for left := 0; left < levelSize; left += 2 {
			right := utils.Min(left+1, levelSize-1)
			leftBytes := result[levelOffset+left]
			// fmt.Println("===>>>", levelOffset, left, right)

			rightBytes := result[levelOffset+right]
			result = append(result, utils.DoubleDigest(utils.Concatenate(leftBytes, rightBytes)))
		}
		levelOffset += levelSize
		levelSize = (levelSize + 1) / 2
		if levelSize == 1 {
			break
		}
	}

	return result[len(result)-1]
}
