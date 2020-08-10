import axios from "axios";
import qs from 'qs';

// 封装 get 请求
 let axiosGet = axios.create({
    baseURL:'http://localhost:3000', // 基础服务器地址 发请求时会形成 baseUrl + /user/login 形式
    timeout: 3000,
		
})

// 封装 post 请求
let axiosPost = axios.create({
    baseURL:'http://localhost:3000',
    method:'post',
    headers:{'Content-Type':'application/x-www-form-urlencoded'}, // 设置post  请求消息头
    timeout: 3000,
    // 允许在向服务器发送前，修改请求数据
    transformRequest: [function (data) { 
        console.log(data)
        // 对 data 进行任意转换处理  使用 qs 解析 qs.stringify()将对象 序列化成URL的形式，以&进行拼接 
        data = qs.stringify(data);
        return data;
    }]
})



export {axiosGet,axiosPost}