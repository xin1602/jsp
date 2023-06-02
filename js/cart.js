//减法
function minus(index) {
//获取当前数量的值
    var amounts=document.getElementsByName("amount");
    //得到第一个amount的元素的value属性的值
    var count=parseInt(amounts[index].value); //数量加1
    if (count<=1){
        alert("沒了！！");
    } else {
        //得到第一个amount的元素的value属性的值
        var count=parseInt(amounts[index].value)-1; //数量加1
        //重新把count的值绑定在数量文本框里
        amounts[index].value=count;
        var prices=document.getElementsByName("price");
        var price=parseFloat(prices[index].value);
        //乘以Math.pow(10,2)的原因为避免失真
        var totalMoney=((price*Math.pow(10,2))*count)/Math.pow(10,2);
        document.getElementById("price"+index).innerHTML="NT$:"+totalMoney;
    }
    total();
}
//加法
function plus(index) {
    //获取当前数量的值
    var amounts=document.getElementsByName("amount");
    //得到第一个amount的元素的value属性的值
    var count=parseInt(amounts[index].value)+1; //数量加1
    //重新把count的值绑定在数量文本框里
    amounts[index].value=count;
    //当前操作端口的价格也要重新计算
    //得到当前端口的单价
    var prices=document.getElementsByName("price");
    var price=parseFloat(prices[index].value);
    //乘以Math.pow(10,2)的原因为避免失真
    var totalMoney=((price*Math.pow(10,2))*count)/Math.pow(10,2);
    //把当前价格显示在文本中
    document.getElementById("price"+index).innerHTML="NT$:"+totalMoney;
    total();
}
//求总金额
function total() {
    //得到所有的数量
    var counts=document.getElementsByName("amount");
    //得到所有的单价
    var prices=document.getElementsByName("price");
    var sumMoney=0;
    for (var i=0;i<counts.length;i++){
        //乘以Math.pow(10,2)的原因为避免失真
        sumMoney+=(parseFloat(prices[i].value)*Math.pow(10,2)*parseInt(counts[i].value)/Math.pow(10,2));
    }
    //把总金额显示再指定的元素中
    document.getElementById("totalPrice").innerHTML="NT$:"+sumMoney;
}

//删除
function delete1() {
    if (confirm("確認要刪除嗎？")) {
        var del=document.getElementById("first");
        del.parentNode.removeChild(del);
        alert("刪除成功！！");
    }
}