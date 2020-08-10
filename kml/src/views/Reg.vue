<template>
    <div class="reg c">
        <h1 class="t-color">短信登录/注册</h1>
        <div class="bar">
            <label for="" class="t-color" >手机号码:</label>
            <input type="text" placeholder="请输入您的手机号码" @blur="checkphone()" v-model="phone"> <span v-text="remindphone" class="remind"></span>
        </div>
        <div class="bar">
            <label for="" class="t-color">密码:</label>
            <input type="text" placeholder="请输入您的密码" @blur="checkpassword()" v-model="password"> <span v-text="remindpassword" class="remind"></span>
        </div>
        <div class="bar">
            <label for="" class="t-color">重复密码</label>
            <input type="text" placeholder="请再次输入密码" @blur="checkpassword2()" v-model="password2"> <span v-text="remindpassword2" class="remind"></span>
        </div>
        <div class="bar">
            <span class="btn t-bg" @click="handle()">立即注册</span>
            <span class="t-color arr">→</span>
            <span class="t-color">
                我已经注册了
                <br>
                现在就
                <router-link to="/login">登录</router-link>
            </span>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            phone:'',
            password:'',
            password2:'',
            remindphone:'*',
            remindpassword:'*',
            remindpassword2:'*'
        }
    },
    methods:{
        checkphone(){
            let phone=this.phone;
            let phonereg=/^1[3-9]\d{9}$/
            if(phonereg.test(phone)){
                this.remindphone='√';
                return true;
            }else{
                this.remindphone='请输入正确的手机号';
                return false;
            }
        },
        checkpassword(){
            let password=this.password;
            let passwordreg=/^[0-9A-Za-z_]{6,12}$/;
            if(passwordreg.test(password)){
                this.remindpassword="√"
                return true;
            }else{
                this.remindpassword="请使用6~12位的大小写字母数字或下划线"
                // alert("请使用6~12位的大小写字母数字或下划线");
                return false;
            }
        },
        checkpassword2(){
            if(this.password2 == this.password){
                this.remindpassword2='√';
                return true;
            }else{
                this.remindpassword2='两次密码不一致';
                return false;
            }
        },
        handle(){
             if(this.checkphone() && this.checkpassword() && this.checkpassword2()){
                 this.axios.post('/users/reg/v1','phone='+this.phone+'&password='+this.password).then(res=>{
                     if(res.data.code == 0){
                         alert("注册提示","对不起,用户已存在");
                         }else{
                             this.$router.push('/login');
                        }
                })
            }
        }
    }
}
</script>
<style scoped>
.reg{
    width: 900px;
    border: 1px solid #e5e5e5;
    margin-top: 60px;
}
.reg>h1{
    height: 60px;
    line-height: 60px;
    text-indent: 40px;
    margin-bottom: 20px;
    background-color: #f6f6f6;
    border-bottom:1px dashed #c2c2c2;
    font-size: 18px;
    font-weight: bold;
}
.reg>.bar{
    padding-left: 190px;
    margin-bottom: 20px;
}
.reg>.bar>.arr{
    height: 40px;
    line-height: 40px;
    margin: 0 10px 0 95px;
    font-size: 30px;
}
.reg>.bar>.remind{
    color: red;
}
.t-color{
    color: #5D3935;
}
.t-bg{
    background-color: #5D3935;
}
.reg>.bar>label{
    width: 180px;
    margin-left: -180px;
    float: left;
    height: 40px;
    line-height: 40px;
    font-size: 16px;
    text-align: right;
}
.reg>.bar>input{
    height: 38px;
    line-height: 38px;
    border: 1px solid #ebebeb;
    width: 400px;
    /* margin-bottom: 20px; */
    font-size: 16px;
    text-indent: 15px;
    outline: none;
}
.reg span{
    display: inline-block;
    vertical-align: middle;
}
.reg>div>.btn{
    width: 280px;
    height: 40px;
    line-height: 40px;
    text-align: center;
    color: #fff;
    font-size: 16px;
}
</style>