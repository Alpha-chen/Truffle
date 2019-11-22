pragma solidity >=0.4.21 <0.6.0;

contract Coin {

    // 关键字“public”让这些变量可以从外部读取
    address  public minter;//address  合约的地址， 秘钥地址
    mapping(address => uint)public balances;
    // 轻客户端通过事件针对变化做出高效的反应
    // 往 公链上发送更改数据的请求，可监听该方法
    event Sent(address from, address to, uint amount);

    //合约的构造函数， 只有创建的时候才会运行
    constructor() public {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {

        if (msg.sender != minter) return;

        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        if (balances[msg.sender] < amount) return;

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);

    }


}
