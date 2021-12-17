// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//ownable은 누가 만들었느냐에 대한거고 배포할떄 누가 배포했느냐 , 이컨트랙트의 주인
contract MyNFT is ERC721,Ownable{
    //1. minting : name , symbol, decimal , tokenURI, description, owner (msg.sender)  ->  metadata need to tokenURI(토큰정보)
    //2. tokenURI 랑 tokenID 연결  : 각 토큰마다 고유한 tokenID 갖고있어야한다, tokenID(contract가 만드는것)
    //3. 각 token마다 URI , 주인
    
    uint256 public tokenID;
    mapping(uint256 =>string) public _tokenURIs;
    //mapping(uint256 => address) _owners; //tokenID로 
    //_nft_tokens[tokenID]=address; 
    mapping(address=>uint256[]) public _tokenOwners; // uint256[]은 tokenID

    constructor() ERC721("test","test"){
        console.log("MyNFT constructor");
        tokenID = 0;
    }

    //minting의 주인은 msg.sender 
    //tokenURI 에 metadata정보 다 들어있다.
    //{name : "" , description, tokenURI: ""} -> IPFS 
    //http imageURL 로 tokenURI 생성 ipfs를 통해서 만들수 있나 , 
    //owner는 이 컨트랙트를 배포한 서비스계정이라고 생각하면되고 , msg.sender는 트랜젝션발생시킨 사람
    function mintMynft(string memory tokenURI) public{
        console.log("MyNFT mintMynft");
        _mint(owner(), tokenID); //운영자계정이 있어야함 msg.sender를 운영자계정으로 바꾸어야한다
        _tokenURIs[tokenID] = tokenURI;
        _tokenOwners[msg.sender].push(tokenID); //멤버변수 추가할떄마다 신경써주어야함!
        tokenID++;
    }
        //tokenID리스트를 리턴받아서 ID로 찾는다 
    function showNFTList(address account) public
    {
        console.log("MyNFTshowNFTList");
        uint256 size = balanceOf(account);
        uint256[] memory balance = new uint[](size);
        balance =_tokenOwners[account];

        //_tokenURIs[account];
    }
    //미당첨자에게 랜덤으로 보유한 nft를 transfer할것이다
    //미당첨자는 몇명인가, 미당첨자 address[]필요? 
    function transfer(address _to, uint256 _id) public {
        //require(msg.sender,);
        console.log("transfer");
        _transfer(msg.sender, _to, _id);
        //임시 random 값은 4, 5, 2 ,1, 3
        //uint256[] arr={ 4, 5, 2 ,1, 3};
        //_tokenURIs[tokenID]
        //_tokenURIs[tokenID];
    }




    // function mintMynft2(address from,string memory tokenURI) public{
    //     _mint(from, tokenID);
    //     _tokenURIs[tokenID] = tokenURI;
    //     tokenID++;
    // }

}
