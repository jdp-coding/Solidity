// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
A라고 하는 erc-20(decimal 0)을 발행하고, B라는 NFT를 발행하십시오.
A 토큰은 개당 0.001eth 정가로 판매한다.
B NFT는 오직 A로만 구매할 수 있고 가격은 50으로 시작합니다.
첫 10명은 50A, 그 다음 20명은 100A, 그 다음 40명은 200A로 가격이 상승합니다. (추가는 안해도 됨)

B를 burn 하면 20 A만큼 환불 받을 수 있고, 만약에 C라고 하는 contract에 전송하면 30A 만큼 받는 기능도 구현하세요.
*/

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AToken is ERC20, Ownable {

    uint public constant PRICE_PER_TOKEN = 0.001 ether;

    constructor() ERC20("AToken", "A") {
        _mint(address(this), 1000000);
    }

    function buyTokens(uint amount) external payable {
        require(msg.value == amount * PRICE_PER_TOKEN, "Incorrect Value!");
        _transfer(address(this), msg.sender, amount);
    }

    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }


}

contract BNFT is ERC721, Ownable {

    AToken public aToken;
    
    constructor(address _aToken) ERC721("BNFT", "B") {
        aToken = AToken(_aToken);
    }
    
}
