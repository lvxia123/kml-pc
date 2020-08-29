var express=require("express");
var router=express.Router();
var pool=require("../pool");
var query=require("./query");
var qs=require('qs');

router.post("/v1/add",(req,res)=>{
  let str=qs.stringify(req.body);
  let obj=qs.parse(str);
  let arr=obj.carItems;
  // console.log(res.body,typeof(res.body))
  // console.log(str,typeof(str));
  console.log(req.body,str,obj);
  
  arr.forEach(item => {
    let uid=item.uid;
    let cid=item.cid;
    let count=item.count;
    console.log(uid,cid,count)
    let sql="select * from kml_shoppingcart_item where  user_id=? and product_id=?";
    query(sql,[uid,cid])
    .then(result=>{
      console.log(result);
      if(result.length==0){
        let sql="insert into kml_shoppingcart_item values(null,?,?,?,0)";
        pool.query(sql,[uid,cid,count],(err,result)=>{
          if(err) throw err;
          // res.send({message:'提交成功',code:200});
        })
      }else{
        let sql="update kml_shoppingcart_item set count=count+? where product_id=? and user_id=?";
        pool.query(sql,[count,cid,uid],(err,result)=>{
          if(err) throw err;
          // res.send({message:'更新成功',code:200});
        })
      }
      res.send({message:'提交成功',code:200});
    })
  });
  
})




module.exports=router;