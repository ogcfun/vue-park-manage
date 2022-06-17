<template>
  <el-form :model="form" :rules="rules" ref="form">
    <el-form-item label="用户账号" prop="user_account">
      <el-input v-model="form.user_account" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="用户头像">
      <br>
     <el-upload
    class="avatar-uploader"
    :action="getAddImage"
    :show-file-list="false"
    :on-success="handleAvatarSuccess"
    :before-upload="beforeAvatarUpload"
  >
    <img v-if="form.image" :src="baseUrl() + this.form.image" class="avatar" />
    <i v-else class="el-icon-plus avatar-uploader-icon"></i>
  </el-upload>
    </el-form-item>
    <el-form-item label="用户名称" prop="user_name">
      <el-input v-model="form.user_name" auto-complete="off"></el-input>
    </el-form-item>
    <!-- <el-form-item label="用户密码" prop="user_password">
      <el-input v-model="form.user_password" auto-complete="off"></el-input>
    </el-form-item> -->
    <el-form-item label="邮箱" prop="email">
      <el-input v-model="form.email" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="地址" prop="addr">
      <el-input v-model="form.addr" auto-complete="off"></el-input>
    </el-form-item>
  </el-form>
</template>

<script>
import { baseUrl } from 'network/request';
export default {
  name: "CommomForm",
  props: {
    form: Object,
  },
  data() {
    return {
      rules: {
        user_name: [
            { required: true, message: "请输入用户名称,由中文组成" },
            { min: 2, max: 18, message: '用户名称长度在 2 到 18 个字符,由中文组成', trigger: 'blur' }
        ],
        user_account:[
            { required: true, message: "请输入用户账号,由数字、26个英文字母或者下划线组成" },
            { min: 6, max: 12, message: '用户账号长度在 6 到 12 个字符,由数字、26个英文字母或者下划线组成', trigger: 'blur' }
        ],
        user_password:[
            { required: true, message: "请输入用户密码,由数字、26个英文字母或者下划线组成" },
            { min: 6, max: 18, message: '用户密码长度在 6 到 18 个字符,由数字、26个英文字母或者下划线组成', trigger: 'blur' }
        ],
        addr:[
            { required: true, message: "请输入地址,由中文组成" },
            { min: 6, max: 24, message: '地址长度在 6 到 24 个字符,由中文组成', trigger: 'blur' }
        ],
        email:[{ type: 'email', message: '请输入正确的邮箱地址', trigger: 'change' }],
  
      }
    };
  },
  methods: {
      baseUrl() {
        return baseUrl()
      },
      handleAvatarSuccess(res, file) {
        this.form.image = file.response.imageurl;
      },
      beforeAvatarUpload(file) {
        const isJPG = 
        file.type === 'image/jpeg' || 
        file.type === 'image/jpg' || 
        file.type === 'image/png' || 
        file.type === 'image/svg';
        const isLt2M = file.size / 1024 / 1024 < 2;

        if (!isJPG) {
          this.$message.error('上传头像图片格式错误');
        }
        if (!isLt2M) {
          this.$message.error('上传头像图片大小不能超过 2MB!');
        }
        return isJPG && isLt2M;
      },
    },
    computed:{
      getAddImage(){
          return baseUrl()+"file.php"
      },
    },
};
</script>

<style lang="less">
.avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
</style>