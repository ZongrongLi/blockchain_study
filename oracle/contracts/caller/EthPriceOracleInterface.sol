pragma solidity 0.8.4;
contract EthPriceOracleInterface {
  function getLatestEthPrice() public returns (uint256);
}
