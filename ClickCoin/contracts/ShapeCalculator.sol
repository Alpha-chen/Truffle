pragma solidity >=0.4.21 <0.6.0;

/***

@title 形状计算器
*/
contract ShapeCalculator {


    function rectangle(uint width, uint height)  public returns (uint s, uint p){
        s = width * height;
        p = 2 * (width + height);

    }

}
