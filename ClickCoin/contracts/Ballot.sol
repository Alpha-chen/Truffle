pragma solidity >=0.4.0;

contract Ballot {

    struct Voter {// 结构
        uint weight;
        bool voted;
        address delegate;
        uint vote;
    }
    constructor()  public {

    }
}
