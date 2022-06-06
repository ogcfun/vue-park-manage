<template>
  <div id="user">
    <el-dialog
      :title="operateType === 'add' ? '新增用户' : '编辑用户'"
      :visible.sync="isShow"
    >
      <common-form :form="form"></common-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="isShow = false">取消</el-button>
        <el-button type="primary" @click="handleSet">确定</el-button>
      </div>
    </el-dialog>

    <div class="manage-header">
      <div>
        <el-button type="primary" @click="addUser" icon="el-icon-plus"
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
        :userData="userData"
        :tableLabel="tableLabel"
        @edit="editUser"
        @del="delUser"
        @page="pageUser"
      ></common-table>
    </el-card>
  </div>
</template>

<script>
import axios from "axios";
import CommonTable from "components/common/commonTable/CommonTable.vue";
import CommonForm from "components/common/commonTable/CommomForm.vue";

import { getAddUser, getUseUser, getDelUser, getPageUser, getSortUser,getSearchUser, getUserData } from "network/user";

export default {
  inject: ["reload"],
  name: "User",
  components: {
    CommonTable,
    CommonForm,
  },
  data() {
    return {
      operateType: "add",
      isShow: false,
      userData: [],
      tableLabel: [
        {
          prop: "user_name",
          label: "用户名称",
        },
        {
          prop: "user_account",
          label: "用户账号",
          width: 180,
        },
        {
          prop: "user_password",
          label: "用户密码",
          width: 180,
        },
        {
          prop: "email",
          label: "邮箱",
          width: 200,
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
        {
          prop: "state",
          label: "账号状态",
          width: 180,
        },
      ],
      form: {
        id: "", //用户id
        user_name: "", //用户名称
        user_account: "", //用户账号
        user_password: "", //账号密码
        state: "", //账号状态
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
      this.operateType = "add";
      this.form.user_name = "";
      this.form.user_account = "";
      this.form.user_password = "";
      this.form.state = "正常";
      this.form.email = "";
      this.form.addr = "";
    },
    editUser(index, row) {
      this.operateType = "edit";
      this.isShow = true;
      // console.log(index,row);
      this.form.id = row.id;
      this.form.user_name = row.user_name;
      this.form.user_account = row.user_account;
      this.form.user_password = row.user_password;
      this.form.state = row.state;
      this.form.email = row.email;
      this.form.addr = row.addr;
    },
    handleSet(index, row) {
      if (this.operateType == "add") {
        var addparams = {
          user_name: this.form.user_name,
          user_account: this.form.user_account,
          user_password: this.form.user_password,
          state: this.form.state,
          email: this.form.email,
          addr: this.form.addr,
        };

        // 新增
        let adduserparams = this.$qs.stringify({ addparams });
        // axios
        //   .post("http://localhost/park-manage/src/api/add_user.php", adduserparams)
        //   .then((res) => {
        //     if (this.operateType == "add" && res.data.code === 200) {
        //       this.isShow = false;
        //       this.$message({
        //         message: res.data.msg,
        //         type: "success",
        //       });
        //     } else if (this.operateType == "add" && res.data.code === -2) {
        //       this.$message({
        //         message: res.data.msg,
        //         type: "danger",
        //       });
        //     }
        //   });
        getAddUser(adduserparams).then((res) => {
          console.log(res);
          if (this.operateType == "add" && res.code === 200) {
            this.isShow = false;
            this.$message({
              message: res.msg,
              type: "success",
            });
          } else if (this.operateType == "add" && res.code === -2) {
            this.$message({
              message: res.msg,
              type: "danger",
            });
          }
        });
      } else if (this.operateType == "edit") {
        var upparams = {
          id: this.form.id,
          user_name: this.form.user_name,
          user_account: this.form.user_account,
          user_password: this.form.user_password,
          state: this.form.state,
          email: this.form.email,
          addr: this.form.addr,
        };

        // 更改
        let updataparams = this.$qs.stringify({ upparams });
        // axios
        //   .post(
        //     "http://localhost/park-manage/src/api/use_user.php",
        //     updataparams
        //   )
        //   .then((res) => {
        //     if (this.operateType == "edit" && res.data.code === 100) {
        //       this.isShow = false;
        //       this.$message({
        //         message: res.data.msg,
        //         type: "success",
        //       });
        //     } else if (this.operateType == "edit" && res.data.code === -1) {
        //       this.$message({
        //         message: res.data.msg,
        //         type: "danger",
        //       });
        //     }
        //   });
        getUseUser(updataparams).then(res => {
          if (this.operateType == "edit" && res.code === 100) {
              this.isShow = false;
              this.$message({
                message: res.msg,
                type: "success",
              });
            } else if (this.operateType == "edit" && res.code === -1) {
              this.$message({
                message: res.msg,
                type: "danger",
              });
            }
        })
      }
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
        // let del = this.$qs.stringify({ id });
        // console.log(del);
        // axios
        //   .get("http://localhost/park-manage/src/api/del_user.php", {
        //     params: {
        //       id: row.id,
        //     },
        //   })
        //   .then((res) => {
        //     if (res.data.code === 300) {
        //       this.$message({
        //         message: res.data.msg,
        //         type: "success",
        //       });
        //     } else if (res.data.code === -3) {
        //       this.$message({
        //         message: res.data.msg,
        //         type: "danger",
        //       });
        //     }
        //   });
        getDelUser(id).then(res => {
          if (res.code === 300) {
              this.$message({
                message: res.msg,
                type: "success",
              });
            } else if (res.code === -3) {
              this.$message({
                message: res.msg,
                type: "danger",
              });
            }
        })
      });
    },

    // 分页
    pageUser(page) {
      this.page = page;
      // axios
      //   .get("http://localhost/park-manage/src/api/user.php", {
      //     params: {
      //       sortType: this.sortType,
      //       page: this.page,
      //     },
      //   })
      //   .then((res) => {
      //     this.userData = res.data.data.tb_userlist;
      //   });
      getPageUser(this.sortType,this.page).then(res => {
         this.userData = res.data.tb_userlist;
      })
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
      // axios
      //   .get("http://localhost/park-manage/src/api/user.php", {
      //     params: {
      //       sortType: this.sortType,
      //       page: this.page,
      //     },
      //   })
      //   .then((res) => {
      //     this.userData = res.data.data.tb_userlist;
      //   });
      getSortUser(this.sortType,this.page).then(res => {
        this.userData = res.data.tb_userlist;
      })
    },

    // 搜索
    searchUser() {
      // axios
      //   .get("http://localhost/park-manage/src/api/user.php", {
      //     params: {
      //       parameter: this.parameter,
      //     },
      //   })
      //   .then((res) => {
      //     // console.log(res);
      //     this.userData = res.data.data.tb_userlist;
      //   });
      getSearchUser(this.parameter).then(res => {
        this.userData = res.data.tb_userlist;
      })
    },
  },
  mounted() {
    getUserData().then((res) => {
      this.userData = res.data.tb_userlist;
      // console.log(res);
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
    width: 250px;
    margin-right: 5px;
    margin-top: 2px;
  }
}
</style>