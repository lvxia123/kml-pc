const express=require('express');
const pool=require('../pool.js');
const router=express.Router();
var query=require("./query");
// 0.获取背景图片
router.get('/v1/bg',(req,res)=>{
  let sql="SELECT gid,img FROM kml_goods_bg";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})
router.get('/v1/nav',(req,res)=>{
  let sql="select fid,fname,href from kml_cake_family";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})
//1.商品列表
router.get('/v1/list',(req,res)=>{
	//1.1获取数据
  let page=req.query.page;
  // 分页实质上利用了select语句的Limit语句 
  // 起始页=（页码-1）每页的数量 
  let offset = (page-1) * 5;
  // 声明一个变量用于存储甲酸的总页数
  // 获取总记录数的操作
  let sql='select count(pid) as count from kml_goods_product'
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    // 因为聚合函数只有一个返回结果，所以result[0]将返回该结果
    let rowCount = result[0].count;
    // console.log(rowCount);
    // 声明一个变量显示每页显示的记录数
    let pagesize = 5;
    let pagecount =Math.ceil(rowCount/pagesize)
    let sql="SELECT * FROM kml_goods_product  LIMIT "+offset+ "," +pagesize ;
    pool.query(sql,(err,results)=>{
      if(err) throw err;
      console.log(results);
       res.send({message:'查询成功',code:1,results:results,pagecount:pagecount,rowCount:rowCount});
    });
    
  })
   //res.send('s');
})

//3.分类商品的查询

router.get("/v1/search",(req,res)=>{
  //获取客户端URL地址栏的参数
  let cid=req.query.pid;
  console.log(cid);
  let page=req.query.page;
  // 分页实质上利用了select语句的Limit语句 
  // 起始页=（页码-1）每页的数量 
  let offset = (page-1) * 5;
  // 声明一个变量用于存储甲酸的总页数
  // 获取总记录数的操作
  let sql='select count(pid) as count from kml_goods_product where family_id=?'
  pool.query(sql,[cid],(err,result)=>{
    if(err) throw err;
    // 因为聚合函数只有一个返回结果，所以result[0]将返回该结果
    let rowCount = result[0].count;
    console.log(rowCount);
    // 声明一个变量显示每页显示的记录数
    let pagesize = 5;
    let pagecount =Math.ceil(rowCount/pagesize)
    let sql="SELECT * FROM kml_goods_product where family_id=? LIMIT "+offset+ "," +pagesize ;
    pool.query(sql,[cid],(err,results)=>{
      if(err) throw err;
      // console.log(results);
       res.send({message:'查询成功',code:1,results:results,pagecount:pagecount,rowCount:rowCount});
    });
    
  })
}) 



module.exports=router;