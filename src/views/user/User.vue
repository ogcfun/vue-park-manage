<template>
  <div id="user">
    <el-dialog
      :title="operateType === 'add' ? '新增用户' : '编辑用户'"
      :visible.sync="isShow"
    >
      <common-form :form="form" ></common-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="isShow = false">取消</el-button>
        <el-button type="primary"  @click="handleSet">确定</el-button>
      </div>
    </el-dialog>

    <div class="manage-header">
      <el-button type="primary" @click="addUser">+ 新增用户</el-button>
      <div>
        <el-autocomplete
          class="inline-input"
          v-model="disease"
          placeholder="请输入用户id/名称"
          :trigger-on-focus="false"
        ></el-autocomplete>
        <el-button type="primary">搜索</el-button>
      </div>
    </div>

    <el-card style="width: auto; margin-top: 30px">
      <common-table
        :userData="userData"
        :tableLabel="tableLabel"
        @edit="editUser"
      ></common-table>
    </el-card>
  </div>
</template>

<script>
import CommonTable from "components/common/commonTable/CommonTable.vue";
import CommonForm from "components/common/commonTable/CommomForm.vue";

import { getUserData } from "network/user";

export default {
  name: "User",
  components: {
    CommonTable,
    CommonForm,
  },
  data() {
    return {
      operateType: "add",
      disease: "",
      isShow: false,
      userData: [],
      tableLabel: [
        {
          prop: "user_name",
          label: "用户名称",
        },
        {
          prop: "user_password",
          label: "用户密码",
          width: 180,
        },
        {
          prop: "user_permissions",
          label: "用户权限",
          width: 200,
        },
        {
          prop: "memo",
          label: "备注",
        },
        {
          prop: "state",
          label: "账号状态",
        },
        {
          prop: "addr",
          label: "地址",
          width: 320,
        },
        {
          prop: "user_time",
          label: "注册时间",
          width: 280,
        },
      ],
      form: {
        user_name:'',
        user_password: "",
        user_permissions: "",
        state: "",
        memo: "",
        addr: ""
      },
    };
  },
  methods: {
    addUser() {
      this.isShow = true
      this.operateType = 'add'
      this.form.user_name = ""
      this.form.user_password = ""
      this.form.user_permissions = "管理员"
      this.form.state = "正常"
      this.form.memo = "无"
      this.form.addr = ""
    },
    editUser(index,row) {
      this.operateType = "edit";
      this.isShow = true;
      // console.log(index,row);
      this.form.user_name = row.user_name
      this.form.user_password = row.user_password
      this.form.user_permissions = row.user_permissions
      this.form.state = row.state
      this.form.memo = row.memo
      this.form.addr = row.addr
    },
    handleSet (index, row) {
      var params = {
        user_name: this.form.user_name,
        user_password: this.form.user_password,
        user_permissions: this.form.user_permissions,
        state: this.form.state,
        memo: this.form.memo,
        addr: this.form.addr
      }
      console.log(params);
      if(this.form.user_name != this.form.user_name.match(/^[\u4E00-\u9FA5]{2,4}$/g)){
        this.$message.error('用户名输入错误');
        return
      }
      if(this.form.user_password != this.form.user_password.match(/^[0-9]{6,8}$/g)){
        this.$message.error('密码输入错误');
        return
      }
      if(this.form.user_name != this.form.user_name.match(/^[\u4E00-\u9FA5]{2,60}$/g)){
        this.$message.error('用户地址输入错误');
        return
      }
      if(this.operateType = 'add'){
        this.isShow = false
        this.$message({
          message: '新增用户成功',
          type: 'success'
        })
        return
      }
      if(this.operateType = 'edit'){
        this.isShow = false
        this.$message({
          message: '修改用户成功',
          type: 'success'
        })
        return
      }
    }
  },
  mounted() {
    getUserData().then((res) => {
      this.userData = res.data.tb_userlist;
      console.log(res);
    });
  },
};
</script>

<style lang="less" scoped>
.manage-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  .inline-input {
    margin-right: 5px;
    margin-top: 2px;
  }
}
</style>