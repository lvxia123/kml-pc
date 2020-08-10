<template>
  <div class="footer">
      <div class="pos">
          <div class="fl">
          <p>订购专线：4001-023-866</p>
          <p>渝ICP备13001878号-3</p>
          <p>COPYRIGHT©2013-2022 Kissmilan 版权所有</p>
          <p>重庆市江北区北滨一路456号S1栋四层商业3号商铺</p>
          <p>技术支持: 迈小步科技有限公司</p>
      </div>
      <div class="fr">
          <router-link to="/ask" class="pr">联系我们</router-link>
          <router-link to="/buyHelp" class="pr">订购帮助</router-link>
          <img src="img/index/wb_.d06f03b.png">
          <img src="img/index/wx_.f9e8887.png">
      </div>
      </div>
  </div>
</template>
<style scoped>
.footer{
    font-size: 14px;
    padding: 25px 0;
    margin-top: 40px;
    border-top: 1px solid #491903;
}
.footer>.pos{
    width: 1200px;
    margin: 0 auto;
    color: #a36663;
    position: relative;
}
.footer>.pos>.fr>a{
    text-decoration: none;
    color: #a36663;
    padding: 0 15px;
}
.footer>.pos>.fr>img{
    margin: 0 0 -10px 20px;
}
.fl{
    float: left;
}
.fr{
    float: right;
}
</style>