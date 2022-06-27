<template>
  <el-form
    :model="sign_form"
    status-icon
    :rules="rules"
    ref="form"
    width="100px"
    class="login-container"
  >
    <h3 class="login_title">某公园售票系统管理员注册</h3>
    <el-form-item
      v-for="(item, index) in userData"
      :key="index"
      :label="item.label"
      :prop="item.porp"
    >
      <el-input
        :key="index"
        :type="item.type"
        v-model="sign_form[item.val]"
        autocomplete="off"
        :placeholder="item.place"
      >
      </el-input>
    </el-form-item>

    <el-form-item label="用户地址" prop="password">
      <el-cascader
        style="width: 100%"
        ref="casCader"
        size="large"
        :options="options"
        v-model="selectedOptions"
        @change="handleChange"
      >
      </el-cascader>
    </el-form-item>
    <el-form-item class="login_submit">
      <el-button type="primary" @click="signUp" class="login_snbmit"
        >申请成为管理员</el-button
      >
    </el-form-item>
    <div class="signUp">
      <span>已有账号？<a @click="signIn">去登录</a></span>
    </div>
  </el-form>
</template>
<script>
import { regionData } from "element-china-area-data"; //先在需要显示省市区的页面
import {getAddSign} from 'network/sign';

export default {
  name: "SignUp",
  data() {
    return {
      options: regionData,
      selectedOptions: [],
      info: [],
      sign_form: {
        name: "",
        username: "",
        password: "",
        Qpassword: "",
        email: "",
        permissions: '管理员',
        state: '正常'
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          {
            min: 3,
            message: "用户名长度不能小于3位",
            trigger: "blur",
          },
        ],
        password: [{ required: true, message: "请输入密码", trigger: "blur" }],
      },
      userData: [
        {
          label: "用户昵称",
          prop: "name",
          type: "input",
          val: "name",
          place: "请输入昵称",
        },
        {
          label: "用户账号",
          prop: "username",
          type: "input",
          val: "username",
          place: "请输入账号",
        },
        {
          label: "用户密码",
          prop: "password",
          type: "password",
          val: "password",
          place: "请输入密码",
        },
        {
          label: "确认密码",
          prop: "Qpassword",
          type: "password",
          val: "Qpassword",
          place: "请再次输入密码",
        },
        {
          label: "用户邮箱",
          prop: "email",
          type: "email",
          val: "email",
          place: "请输入用户邮箱",
        },
      ],
    };
  },
  methods: {
    handleChange(value) {
      //console.log("value", value); //获取到所选省市区的编码
      this.info = this.$refs.casCader.getCheckedNodes()[0].pathLabels; //获取到省市区的名称
      //   console.log("info", this.info);
    },
    signIn() {
      this.$router.push({ name: "login" });
    },
    signUp() {
        if(this.sign_form.password !== this.sign_form.Qpassword){
            this.$message({
                message: '两次密码输入不一致',
                type: "danger",
              });
              return
        }
      var addsign = {
        name: this.sign_form.name,
        username: this.sign_form.username,
        password: this.sign_form.password,
        Qpassword: this.sign_form.Qpassword,
        email: this.sign_form.email,
        addr: this.info[0] + this.info[1] + this.info[2],
        permissions: this.sign_form.permissions,
        state: this.sign_form.state,
      };
      let addSign = this.$qs.stringify({ addsign });
      getAddSign(addSign).then(res => {
        if(res.code === 1500) {
          this.$message({
                message: res.msg,
                type: "success",
              });
              this.$router.push({name: 'login'})
        }else {
           this.$message({
              message: res.msg,
              type: "danger",
            });
        }
      })
    },
  },
};
</script>
<style lang="less" scoped>
body {
  height: 100vh;
  padding: 0;
  margin: 0;
  position: relative;
}
.login-container {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  border-radius: 15px;
  background-clip: padding-box;
  width: 550px;
  padding: 35px 35px 15px 35px;
  background-color: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 25px #cac6c6;
}

.login_title {
  margin: 0 auto 40px auto;
  text-align: center;
  color: #505458;
}

.login_submit {
  margin: 10px 0 20px 170px;
}

.signUp {
  text-align: center;
  span {
    color: rgba(78, 78, 78, 0.5);
    font-size: 10px;
    font-weight: 100;
    a {
      color: rgb(26, 157, 245, 0.5);
      font-size: 12px;
      cursor: pointer;
      font-weight: normal;
    }
  }
}
</style>