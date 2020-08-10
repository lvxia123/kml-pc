const express=require("express");
var router=express.Router();
var pool=require("../pool");
router.get("/v1",(req,res)=>{
  var sql="SELECT cid,cname FROM kml_city";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

module.exports=router;