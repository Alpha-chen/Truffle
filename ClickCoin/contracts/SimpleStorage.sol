pragma solidity >=0.4.21 <0.6.0;

/***
合约中可包扩
1.状态量
2.函数
3.事件
4.函数装饰器
5.结构类型
6.枚举类型的声明
7.合约可以从其他合约进行继承
*/
contract SimpleStorage {
    uint  public storeData;/// 状态变量 public 修饰改状态量(通常为合约的公链地址,) 允许外部合约访问该状态

    address  public seller;

    event increased (address binder, uint amount); // 事件 能够方便的调用evm中的日志


    function update(uint y) public payable {// 函数，调用可以在函数内部，也可以是外部函数，访问控制需要 使用相应的修饰符

    }

    enum  State{Created, Locked, Inactive}// 枚举

    modifier onlySeller(){// 函数装饰器
        require(
            msg.sender == seller,
            "只有seller才能调用次函数"
        );
        _;
    }

    function abort() public onlySeller {// 修改引用

    }

    function bid() public payable {
        emit increased(msg.sender, msg.value);
        // 触发事件
    }

    function get() public view returns (uint){
        return storeData;
    }

    constructor() public {

    }

    function set(uint x) public {
        storeData = x;
    }
}
