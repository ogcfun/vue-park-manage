<template>
  <div id="user">
    <el-dialog
      :title="operateType"
      :visible.sync="isShow"
    >
      <common-form :form="form"></common-form>
      <div
        v-if="this.permissions == '管理员' ? false : true"
        slot="footer"
        class="dialog-footer"
      >
        <el-button @click="isShow = false">取消</el-button>
        <el-button type="primary" @click="handleSet">确定</el-button>
      </div>
    </el-dialog>

    <div class="manage-header">
      <div>
        <el-button
          v-if="this.permissions == '管理员' ? false : true"
          type="primary"
          @click="addUser"
          icon="el-icon-plus"
          >新增用户</el-button
        >
        <el-button
          type="primary"
          @click="getUserList"
          icon="el-icon-refresh-right"
          >刷新列表</el-button
        >
        <el-button type="primary" @click="sortUser" icon="el-icon-sort"
          >正序/倒序</el-button
        >
        <span style="margin: 0 0 0 10px; color: #e2e2e2; font-size: 14px"
          >Tips: 默认密码为123456</span
        >
      </div>
      <div>
        <el-input
          class="inline-input"
          v-model="parameter"
          placeholder="请输入用户id/名称"
          :trigger-on-focus="false"
        ></el-input>
        <el-button type="primary" @click="searchUser">搜索</el-button>
      </div>
    </div>

    <el-card style="width: auto; margin-top: 30px">
      <common-table
        :loading="loading"
        :userData="userData"
        :tableLabel="tableLabel"
        @edit="editUser"
        @del="delUser"
        @page="pageUser"
        @view="viewTheInformation"
      ></common-table>
    </el-card>
  </div>
</template>

<script>
import CommonTable from "components/common/commonTable/CommonTable.vue";
import CommonForm from "components/common/commonTable/CommomForm.vue";

import {
  getAddUser,
  getUseUser,
  getDelUser,
  getPageUser,
  getSortUser,
  getSearchUser,
  getUserData,
} from "network/user";

import Cookie from "js-cookie";
export default {
  inject: ["reload"],
  name: "User",
  components: {
    CommonTable,
    CommonForm,
  },
  data() {
    return {
      permissions:
        this.$store.state.user.permissions || Cookie.get("permissions"),
      loading: true,
      operateType: "add",
      isShow: false,
      userData: [],
      tableLabel: [
        {
          prop: "user_account",
          label: "用户账号",
          width: 180,
        },
        {
          prop: "user_name",
          label: "用户名称",
        },
        // {
        //   prop: "user_password",
        //   label: "用户密码",
        //   width: 180,
        // },
        {
          prop: "email",
          label: "邮箱",
          width: 220,
        },
        {
          prop: "addr",
          label: "地址",
          width: 320,
        },
        {
          prop: "user_time",
          label: "注册时间",
          width: 220,
        },
        {
          prop: "permissions",
          label: "账号权限",
          width: 160,
        },
      ],
      form: {
        id: "", //用户id
        user_name: "", //用户名称
        image: "", //头像
        user_account: "", //用户账号
        user_password: "", //账号密码
        state: "", //账号状态
        permissions: "", //账号权限
        email: "", //邮箱
        addr: "", //地址
      },
      parameter: "",
      sortTp: 2,
      sortType: null,
      page: 1,
      flag: true,
    };
  },
  methods: {
    addUser() {
      this.isShow = true;
      this.operateType = "新增用户";
      this.form.user_name = "";
      this.form.image = "images/default.png";
      this.form.user_account = "";
      this.form.user_password = "";
      this.form.state = "正常";
      this.form.permissions = "游客";
      this.form.email = "";
      this.form.addr = "";
    },
    editUser(index, row) {
      this.operateType = "修改用户";
      this.isShow = true;
      // console.log(index,row);
      this.form.id = row.id;
      this.form.user_name = row.user_name;
      this.form.user_account = row.user_account;
      this.form.image = row.image;
      this.form.user_password = row.user_password;
      this.form.state = row.state;
      this.form.permissions = row.permissions;
      this.form.email = row.email;
      this.form.addr = row.addr;
    },
    handleSet(index, row) {
      if (this.operateType == "新增用户") {
        var addparams = {
          user_name: this.form.user_name,
          user_account: this.form.user_account,
          image: this.form.image,
          user_password: this.form.user_password,
          state: this.form.state,
          permissions: this.form.permissions,
          email: this.form.email,
          addr: this.form.addr,
        };

        // 新增
        let adduserparams = this.$qs.stringify({ addparams });
        getAddUser(adduserparams).then((res) => {
          console.log(res);
          if (this.operateType == "新增用户" && res.code === 200) {
            this.isShow = false;
            this.$message({
              message: res.msg,
              type: "success",
            });
            this.reload();
          } else if (this.operateType == "新增用户" && res.code === -2) {
            this.$message({
              message: res.msg,
              type: "danger",
            });
          }
        });
      } else if (this.operateType == "修改用户") {
        var upparams = {
          id: this.form.id,
          user_name: this.form.user_name,
          user_account: this.form.user_account,
          image: this.form.image,
          user_password: this.form.user_password,
          state: this.form.state,
          permissions: this.form.permissions,
          email: this.form.email,
          addr: this.form.addr,
        };

        // 更改
        let updataparams = this.$qs.stringify({ upparams });
        getUseUser(updataparams).then((res) => {
          // console.log(res);
          if (this.operateType == "修改用户" && res.code === 100) {
            this.isShow = false;
            this.$message({
              message: res.msg,
              type: "success",
            });
            this.reload();
          } else if (this.operateType == "修改用户" && res.code === -1) {
            this.$message({
              message: res.msg,
              type: "danger",
            });
          }
        });
      }
    },

    //查看
    viewTheInformation(index, row) {
      this.operateType = "查看用户";
      this.isShow = true;
      // console.log(index,row);
      this.form.id = row.id;
      this.form.user_name = row.user_name;
      this.form.user_account = row.user_account;
      this.form.image = row.image;
      this.form.user_password = row.user_password;
      this.form.state = row.state;
      this.form.permissions = row.permissions;
      this.form.email = row.email;
      this.form.addr = row.addr;
    },

    // 刷新
    getUserList() {
      this.reload();
    },

    // 删除
    delUser(index, row) {
      this.$confirm("此操作将永久删除该用户，是否继续?", "提示", {
        confirmButtonText: "确认",
        cancelButtonText: "取消",
        type: "warning",
      }).then((res) => {
        const id = row.id;
        getDelUser(id).then((res) => {
          if (res.code === 300) {
            this.$message({
              message: res.msg,
              type: "success",
            });
            this.reload();
          } else if (res.code === -3) {
            this.$message({
              message: res.msg,
              type: "danger",
            });
          }
        });
      });
    },

    // 分页
    pageUser(page) {
      this.page = page;
      getPageUser(this.sortType, this.page).then((res) => {
        this.userData = res.data.tb_userlist;
      });
    },

    // 排序
    sortUser() {
      if (this.flag) {
        this.sortTp = 2;
        this.flag = false;
      } else {
        this.sortTp = 1;
        this.flag = true;
      }
      this.sortType = this.sortTp;
      getSortUser(this.sortType, this.page).then((res) => {
        this.userData = res.data.tb_userlist;
      });
    },

    // 搜索
    searchUser() {
      getSearchUser(this.parameter).then((res) => {
        this.userData = res.data.tb_userlist;
      });
    },
  },
  mounted() {
    setTimeout(() => {
      getUserData().then((res) => {
        this.userData = res.data.tb_userlist;
        this.loading = false;
        // console.log(res);
      });
    }, 1000);
  },
};
</script>

<style lang="less" scoped>
.manage-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  .inline-input {
    width: 250px;
    margin-right: 5px;
    margin-top: 2px;
  }
}
</style>