package main

import "example.com/m/v2/utils"

/*
 @author king 409060350@qq.com
*/

func CalculateMerkleTreeRoot(datas [][]byte) []byte {
	tree := datas[:]
	levelOffset := 0
	for levelSize := len(tree); levelSize > 1; levelSize = (levelSize + 1) / 2 {
		for left := 0; left < levelSize; left += 2 {
			right := utils.Min(left+1, levelSize-1)
			leftBytes := tree[levelOffset+left]
			rightBytes := tree[levelOffset+right]
			tree = append(tree, utils.DoubleDigest(utils.Concatenate(leftBytes, rightBytes)))
		}
		levelOffset += levelSize
	}
	return tree[len(tree)-1]
}
