<template>
  <el-card style="margin: 20px 0 0 0">
    <el-table :data="tableData" border style="width: 100%">
      <el-table-column fixed prop="sign_time" label="申请日期" width="200">
      </el-table-column>
      <el-table-column prop="sign_image" label="头像(查看大图)" width="150">
        <template slot-scope="scope">
          <el-image
            v-if="scope.row.sign_image"
            :src="baseUrl() + scope.row.sign_image"
            :preview-src-list="[baseUrl() + scope.row.sign_image]"
            style="width: 70px; height: 70px"
          >
          </el-image>
        </template>
      </el-table-column>
      <el-table-column prop="sign_name" label="用户昵称" width="120">
      </el-table-column>
      <el-table-column prop="sign_account" label="用户账号" width="120">
      </el-table-column>
      <el-table-column prop="sign_email" label="用户邮箱" width="220">
      </el-table-column>
      <el-table-column prop="sign_addr" label="用户地址" width="320">
      </el-table-column>
      <el-table-column prop="sign_permissions" label="申请权限" width="200">
      </el-table-column>
      <el-table-column prop="sign_state" label="状态" width="120">
      </el-table-column>
      <el-table-column prop="sign_pace" label="进度" width="120">
      </el-table-column>
      <el-table-column label="操作" width="150">
        <template slot-scope="scope">
          <div v-show="scope.row.sign_pace == '未通过' ? true : false">
            <el-tag type="success">已审核</el-tag>
          </div>
          <div v-show="scope.row.sign_pace == '已通过' ? true : false">
            <el-tag type="success">已审核</el-tag>
          </div>
          <div v-show="scope.row.sign_pace == '未审核' ? true : false">
            <el-button
              @click="handleClick(scope.row)"
              type="primary"
              size="medium"
              ><i class="el-icon-check"></i
            ></el-button>
            <el-button @click="delSign(scope.row)" type="danger" size="medium"
              ><i class="el-icon-close"></i
            ></el-button>
          </div>
        </template>
      </el-table-column>
    </el-table>
    <div class="pagination">
      <el-tag type="success" class="tag">共有 {{ pageNum }} 条数据</el-tag>
      <el-pagination
        background
        layout="prev, pager, next"
        :total="total"
        :page-size="6"
        @current-change="handleCurrentChange"
      >
      </el-pagination>
    </div>
  </el-card>
</template>

<script>
import { baseUrl } from "network/request";
import {
  getSignData,
  getDelSign,
  getAgreeSign,
  getPageSign,
} from "network/sign";
import { getAddUser } from "network/user";
export default {
  inject: ["reload"],
  name: "Search",
  data() {
    return {
      page: 1,
      total: 0,
      pageNum: 0,
      tableData: [],
    };
  },
  methods: {
    baseUrl() {
      return baseUrl();
    },
    isShow(row) {
      if (row.sign_pace !== "未通过") {
        return true;
      } else if (row.sign_pace !== "未通过") {
        return false;
      }
    },
    handleClick(row) {
      const signUp_id = row.sign_id;
      var addparams = {
        user_name: row.sign_name,
        user_account: row.sign_account,
        image: row.sign_image,
        user_password: row.sign_password,
        state: row.sign_state,
        permissions: row.sign_permissions,
        email: row.sign_email,
        addr: row.sign_addr,
      };
      let addsignparams = this.$qs.stringify({ addparams });
      console.log(addparams);
      this.$confirm("同意该账号成为管理员，是否继续?", "提示", {
        confirmButtonText: "确认",
        cancelButtonText: "取消",
        type: "warning",
      }).then((res) => {
        getAddUser(addsignparams).then((res) => {
          // console.log(res);
        });
        getAgreeSign(signUp_id).then((res) => {
          // console.log(res);
          if (res.code === 3200) {
            this.$message({
              message: res.msg,
              type: "success",
            });
            this.reload();
          } else {
            this.$message({
              message: res.msg,
              type: "danger",
            });
          }
        });
      });
    },
    delSign(row) {
      this.$confirm("拒绝该账号成为管理员，是否继续?", "提示", {
        confirmButtonText: "确认",
        cancelButtonText: "取消",
        type: "warning",
      }).then((res) => {
        // console.log(row.sign_id);
        const sign_id = row.sign_id;
        getDelSign(sign_id).then((res) => {
          console.log(res);
          if (res.code === 3000) {
            this.$message({
              message: res.msg,
              type: "success",
            });
            this.reload();
          } else {
            this.$message({
              message: res.msg,
              type: "danger",
            });
          }
        });
      });
    },
    // 分页
    handleCurrentChange(page) {
      this.page = page;
      getPageSign(this.page).then((res) => {
        this.tableData = res.data.tb_addsign;
      });
    },
  },
  created() {
    getSignData().then((res) => {
      // console.log(res);
      this.tableData = res.data.tb_addsign;
      this.total = res.totalCount;
      this.pageNum = res.totalCount;
    });
  },
};
</script>

<style lang="less" scoped>
.pagination {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}
</style>