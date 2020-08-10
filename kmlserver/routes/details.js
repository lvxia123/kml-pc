const express=require("express");
var router=express.Router();
var query=require("./query");
router.get("/v1",(req,res)=>{
  var pid=req.query.lid;
  console.log(pid);
  var output={};
  var sql="SELECT * FROM `kml_cake_detail` where family_id=?";
  query(sql,[pid])
  //open(result)->then(result=>{...})
  .then(result=>{
    output.product=result[0];
    console.log(output.product)
    var fid=output.product.family_id;
    var sql="SELECT cid,spec,price FROM `kml_cake_detail` where family_id=?";
    //要想继续用then，必须返回Promise对象
    return query(sql,[fid])//return Promise
  })
  //open(result)->then(result=>{...})
  .then(result=>{
    output.specs=result;
    var sql="SELECT * FROM `kml_cake_pic` where cake_id=?";
    return query(sql,[pid])
  })
  //open(result)->then(result=>{...})
  .then(result=>{
    output.pics=result;
    res.send(output);
  })
  //err(error)->catch(error=>{...})
  .catch(error=>console.log(error))
})
module.exports=router;
//http://localhost:3000/details/v1?lid=3