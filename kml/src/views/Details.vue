<template>
    <div class="details">
        <div class="product-con">
            <!-- 商品详情左侧图片展示 -->
            <div class="product-left">
                <div class="product-left1">
                    <div class="product-left1-img">
                        <img :src="`${pics[i].md}`" alt="">
                    </div>
                    <div class="product-left1-detail">
                        <!-- 事件委托绑定图片的切换 -->
                        <ul @mouseover="changei">
                            <li v-for="(pic,i) of pics" :key="i" >
                                <img :src='`${pic.sm}`' :data-i="i"  alt="">
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 商品详情右侧详细 -->
            <div class="product-right">
                <p class="proudct-right-name" v-text="product.title"></p>
                <div class="proudct-right-detail">
                    <p class="MsoNormal">
                        <span v-text="product.subtitle"></span>
                    </p>
                    <br>
                    <p class="MsoNormal">
                        <span v-text="product.remind"></span>
                    </p>
                    <br>
                </div>
                <!-- 商品规格选项卡 -->
                <ul>
                    <li  v-for="(sp,i) of specs" :key="i" :class="{active:sp.cid==specchang+1}">
                        <!-- <router-link :to="`/details/${sp.cid}`" v-text="sp.spec"></router-link> -->
                        <a href="javascript:;" @click="changspec(i)" v-text="sp.spec"></a>
                    </li>
                </ul>
                <!-- 商品添加功能 -->
                <div class="proudct-right-num">
                    <span class="text"></span>
                    <span class="jian">
                        <button @click="min()">-</button>
                    </span>
                    <span class="num" v-text="num"></span>
                    <span class="jia">
                        <button @click="add()">+</button>
                    </span>
                    <p  class="proudct-right-price"> 
                        价格：
                        <!-- <span  class="proudct-price" v-text="`¥${product.price.toFixed(2)*num}`">  
                        </span> -->
                        <span  class="proudct-price" v-text="`¥${(specs[specchang].price*num).toFixed(2)}`">  
                        </span>
                    </p>
                
                </div>
                <div class="proudct-right-shopping">
                    <a href="javascript:;" class="proudct-right-shopping-car" @click="shoppingCar()">加入购物车</a>
                    <a href="javascript:;" class="proudct-right-shopping-buy" >立刻购买</a>
                </div>
                
            </div>
        </div>
        <!-- <div class="mg">
        </div> -->
        <!-- 商品详情下面 -->
        <div class="proudct-annotation">
            <div class="proudct-details">
                <p>
                    <span>商品详情</span>
                    <span class="p-detail">Product Details</span>
                </p>
                <div>
                    <table>
                        <tr>
                            <td><p v-text="`品牌:${product.brand}`"></p></td>
                            <td><p v-text="`口味:${product.taste}`"></p></td>
                            <td><p v-text="`甜度:${product.sweetness}`"></p></td>
                        </tr>
                        <tr>
                            <td><p v-text="`适合节日:${product.subtitle_day?'所有节日':'平常日'}`"></p></td>
                            <td><p v-text="`适合人群:${product.suitable_person?'所有人':'爱吃甜的人'}`"></p></td>
                            <td><p v-text="`原材料:${product.raw_material}`"></p></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import { mapMutations, mapState } from 'vuex'
export default {
    props:[ "lid" ],
    data(){
       return {
            product:{ price:0 },
            specs:[],
            pics:[{md:"",lg:""}],
            // 商品数量
            num:1,
            // 
            i:0,
            // 规格选项的下标
            specchang:'0',
            // 加购物车有规格时的商品号
            specid:''
        } 
    },
    methods:{
        ...mapMutations(['setCart']),  // 语法糖 进行映射 --> this.setCart()
        ...mapState(['cart']),
        // 事件委托切换图片函数
        changei(e){
            if(e.target.nodeName == 'IMG'){
                this.i=e.target.dataset.i;
            }
        },
        loadPage(){
            this.axios.get("/details/v1",{
                params:{ lid: this.lid } //vue第三天axios
            }).then(result=>{
                console.log(result.data);
                var {product, specs, pics}=result.data;
                this.product=product;
                this.specs=specs;
                this.pics=pics;
                console.log(pics)
           })
        },
        // 改变商品规格
        changspec(i){
            this.specchang= i;
            this.specid = this.specs[i].cid;
            // console.log((this.specs[this.specchang].price*this.num).toFixed(2))
            // this.$router.push(`/details/${lid}`)
        },
        add(){
            this.num++;
        },
        min(){
            if(this.num>1){
                this.num--;
            }
        },
        // 1.将数据放入存
        shoppingCar(){
            var shop={
                is_checked:true,
                pid:this.specs[this.specchang].cid,
                title:this.product.title,
                spec:this.specs[this.specchang].spec,
                price:this.specs[this.specchang].price*this.num,
                count:this.num,
                img:this.pics[0].sm
            };
            console.log(shop);
            // 暂存数据
            this.$store.commit('addToCart',shop)
            alert('添加成功')
            
            // shop=JSON.stringify(shop);
            // localStorage.setItem('shopcart',shop);
            // this.$router.push('/car');
        },
        
        // 2.将数据直接加入数据库
        // shoppingCar(){
        //     let num=this.num;
        //     // 判断是否有不同的规格选项
        //     if(this.specs.length>1){
        //         var pid=this.specid;
        //     }else{
        //         var pid=this.product.cid;
        //     }
        //     console.log(num)
        //     console.log(pid)
        //     this.axios.get('/cartItems/v1/add?pid='+pid+'&num='+num).then(res=>{
        //         console.log(res.data);
        //     });
        //     this.$router.push('/car');
        // }
    },
    created(){
        console.log(this.lid);
        this.loadPage();
        console.log("创建页面组件时发送一次请求...")
    },
    mounted(){
        this.loadPage()
    },
    watch:{
    lid(){  //只要lid一变就重新发送请求！
      this.loadPage();
      console.log("当lid发生变化时，才自动发送一次请求")
      }
    }
}
</script>
<style scoped>
p{
    margin: 0;
}
.details{
    width: 100%;
    padding-top: 85px;
    border-top: 1px solid #d8d0d0;
}
.details>.product-con{
    width: 1200px;
    height: 550px;
    margin: 0 auto;
}
.details>.product-con>.product-left{
    width: 645px;
    overflow: hidden;
    margin-bottom: 28px;
    float: left;
}
.details>.product-con>.product-left>.product-left1{
    width: 645px;
    overflow: hidden;
}
.details>.product-con>.product-left>.product-left1>.product-left1-img {
    width: 638px;
    height: 400px;
    margin-bottom: 10px;
    text-align: center;
}
.details>.product-con>.product-left>.product-left1>.product-left1-img>img {
    width: 400px;
    height: 400px;
}
.details>.product-con>.product-left>.product-left1>.product-left1-detail {
    position: relative;
    width: 645px;
    overflow: hidden;
    height: 126px;
}
.details>.product-con>.product-left>.product-left1>.product-left1-detail ul{
    widows: 398px;
    margin-left: 0px;
}
.details>.product-con>.product-left>.product-left1>.product-left1-detail ul li{
    cursor: pointer;
    margin-left: 3px;
    width: 122px;
    height: 122px;
    border: 2px solid #e7e7e7;
    float: left;
}
.details>.product-con>.product-left>.product-left1-detail ul li img{
    width: 122px;
    height: 122px;
}  
.details>div.mg{
    position: relative;
    z-index: 2;
    width: 200px;
    height: 200px;
    overflow: hidden;
    top: -445px;
    left: 790px;
    background-color: lightgray;
    cursor: pointer;
}
.details>.product-con>.product-right{
    width: 507px;
    float: right;
    color: #854d4b;
}
.details>.product-con>.product-right>.proudct-right-name{
    width: 100%;
    height: 50px;
    line-height: 50px;
    font-size: 24px;
    color: #522725;
    font-weight: 400;
    cursor: pointer;
}

.details>.product-con>.product-right ul{
    list-style: none;
    padding-bottom: 20px;
    overflow: hidden;
    width: 527px;
    margin-bottom: 31px;
}
.details>.product-con>.product-right ul li{
    float: left;
    width: 200px;
    height: 41px;
    padding-left: 20px;
    line-height: 43px;
    border: 1px solid #dcdddd;
    margin-right: 20px;
    margin-top: 11px;
    cursor: pointer;
}
.details>.product-con>.product-right ul li.active{
    color:#6c757d;
    background-color:#f5f5f5;
    /* border-color:#e4393c; */
    border-width:2px;
}
.details>.product-con>.product-right>.proudct-right-detail{
    padding: 10px 0;
    border-top: 1px solid #eee;
    border-bottom: 1px solid #eee;
    line-height: 28px;
    color: #a36663;
    font-size: 14px;
    margin-bottom: 10px;
    text-align: left;
}

.details>.product-con>.product-right>.proudct-right-num>.text{
    font-size: 16px;
    position: relative;
    top: -7px;
}
.details>.product-con>.product-right>.proudct-right-num button{
    position: relative;
    top:-10px
}
.details>.product-con>.product-right>.proudct-right-num>.num{
    padding: 0 20px;
    display: inline-block;
    height: 23px;
    line-height: 25px;
    position: relative;
    top: -7px;
    border: 1px solid #979696;
}
.details>.product-con>.product-right>.proudct-right-price{
    font-size: 16px;
    height: 40px;
    line-height: 40px;
    text-align: left;
    margin-top: 10px;
    margin-bottom: 15px;
    color: #000;
}
.details>.product-con>.product-right>.proudct-right-price.proudct-price{
    font-size: 24px;
    color: #854d4b;
    vertical-align: middle;
}
.details>.product-con>.product-right>.proudct-right-shopping{
    margin-top: 50px;
}
/* .details>.product-con>.product-right>.proudct-right-shopping>span{
    display: inline-block;
    width: 250px;
    height: 39px;
    line-height: 39px;
    text-align: center;
    color: #fff;
} */
.details>.product-con>.product-right>.proudct-right-shopping>a{
    display: inline-block;
    width: 250px;
    height: 39px;
    line-height: 39px;
    text-align: center;
    color: #fff;
}
.details>.product-con>.product-right>.proudct-right-shopping>.proudct-right-shopping-car{
    background-color: #854d4b;
    margin-right: 5px;
    cursor: pointer;
}
.details>.product-con>.product-right>.proudct-right-shopping>.proudct-right-shopping-buy {
    background-color: #522725;
    cursor: pointer;
}
.details>.proudct-annotation{
    width: 100%;
    height: auto;
    margin-top: 28px;
}
.details>.proudct-annotation>.proudct-details{
    width: 1200px;
    margin: 0 auto;
    color: #854d4b;
}
.details>.proudct-annotation>.proudct-details>p {
    border-top: 1px solid #c1e3ec;
    border-bottom: 1px solid #c1e3ec;
    height: 50px;
    line-height: 50px!important;
    text-indent: 15px;
    margin-bottom: 30px;
    font-size: 21px;
    font-weight: 700;
}
.details>.proudct-annotation>.proudct-details>p>span{
    font-weight: 700px;
    font-size: 21px;
}
.details>.proudct-annotation>.proudct-details p .p-detail{
    font-size: 14px;
    color: #aaa;
    font-weight: 400;
    margin-left: 20px;
}
.details>.proudct-annotation>.proudct-details table{
    font-family: 微软雅黑;
    line-height: 30px;
    color: rgb(82, 39, 37);
    width: 1217px;
    font-size: 14px;
}
</style>