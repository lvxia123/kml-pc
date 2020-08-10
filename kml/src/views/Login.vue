<template>
    <div class="login">
        <div class="login-box c">
            <div class="logo-title">
                <span class="cur-bg">密码登录</span>
                <span>验证码登录</span>
            </div>
            <input v-model="phone" @blur="checkphone()"  placeholder="手机号" name="phone" class="ipt">
            <span v-text="phonemsg"></span>
            <input v-model="password" @blur="checkpassword()" type="password" placeholder="密码" name="password" class="ipt">
            <span  v-text="passwordmsg"></span>
            <span class="btn tc t-bg" @click="handle()">立即登录</span>
            <p class="tip fsz12 tc">
                提示:还不是会员？ 通过短信登录，
                <router-link to="/reg" class="">自动注册</router-link>
            为会员~
            </p>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            phone:'',
            password:'',
            phonemsg:'',
            passwordmsg:''
        }
    },
    methods:{
        checkphone(){
            let phone=this.phone;
            let phonereg=/^1[3-9]\d{9}$/;
            if(phonereg.test(phone)){
               this.phonemsg="√"
            return true;
               
            }else{
                this.phonemsg="请输入正确的手机号"   
                // alert("请输入正确的手机号")
                return false;
            }
        },
        checkpassword(){
            let password=this.password;
            let passwordreg=/^[0-9A-Za-z_]{6,12}$/;
            if(passwordreg.test(password)){
                this.passwordmsg="√"
                return true;
            }else{
                this.passwordmsg="请使用6~12位的大小写字母数字或下划线"
                // alert("请使用6~12位的大小写字母数字或下划线");
                return false;
            }
        },
        handle(){
           this.axios.post('/users/login/v1','phone='+this.phone+'&password='+this.password).then(res=>{
               console.log(res.data)
               if(res.data.code == 1){
                    localStorage.setItem('isLogined',true);
                    //修改Vuex中的state
                    this.$store.commit('logined_mutations');
                    this.$router.push('/');
               }else{
                   alert("对不起,用户或密码错误");
               }
           })
        }

    }

}
</script>
<style scoped>
.login>.login-box{
    width: 328px;
    padding: 75px 0 40px;
}
.login>.login-box>.logo-title{
    height: 40px;
    line-height: 40px;
    font-size: 14px;
    background: #522725;
    margin-bottom: 20px;
}
.login>.login-box>.logo-title>.cur-bg{
    background-color: #965653;
}
.login>.login-box>.logo-title>span{
    float: left;
    display: block;
    cursor: pointer;
    width: 50%;
    height: 100%;
    color: #fff;
    text-align: center;
}
.login>.login-box>input{
    border: 1px solid #ebebeb;
    height: 41px;
    line-height: 41px;
    width: 328px;
    margin-bottom: 20px;
    margin-top: 20px;
    outline: none;
    text-indent: 15px;
}

.login-box>.btn {
    display: inline-block;
    border: none;
    color: #fff;
    cursor: pointer;
    margin-top: 15px;
}
.login-box .btn, .login-box .ipt {
    border: 1px solid #ebebeb;
    height: 41px;
    line-height: 41px;
    width: 328px;
    margin-bottom: 20px;
    outline: none;
    text-indent: 15px;
}
.login-box>.tc {
    text-align: center;
}
.login-box>.t-bg{
    background-color: #522725;
}
.login-box>.tip{
    border-top: 1px solid #dcdcdc;
    padding-top: 20px;
    color: #854d4b;
}
.login-box>.tip>a {
    text-decoration: underline;
    color: #595757;
}
</style>