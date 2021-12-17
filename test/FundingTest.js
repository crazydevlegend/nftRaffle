const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("FundingTest", function () {
  it("Should return the new FundingTest once it's changed", async function () {
    const FundingNFT = await ethers.getContractFactory("FundingTest");
    const FundingNFT = await FundingNFT.deploy("FundingTest","FDT"); //무조건 deploy한 계정이 오너가 되고

     await FundingNFT.deployed();
     FundingNFT.mint("TEST");  //raffleNFT.connect(회원1).mint() ,connect는 함수를 누가 실행시켜
     


    // expect(await raffleNFT.get_tokenURI()).to.equal("uri");


    // const setGreetingTx = await raffleNFT.set_tokenURI("Hola, mundo!");

    // // wait until the transaction is mined
    // await setGreetingTx.wait();

    // expect(await raffleNFT.get_tokenURI()).to.equal("Hola,NFT  mundo!");
  });
});
