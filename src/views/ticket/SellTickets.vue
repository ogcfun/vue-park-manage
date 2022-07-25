<template>
  <div>
    <!-- 搜索 -->
    <div class="nav">
      <div>
        <el-input
          class="inline-input"
          v-model="ticketSrc"
          placeholder="请输入游客姓名/票号"
          :trigger-on-focus="false"
        ></el-input>
        <el-button type="primary" @click="searchTicket">搜索</el-button>
      </div>
      <div>
        <!-- 刷新列表 -->
        <el-button
          type="primary"
          @click="getTicketList"
          style="margin: 0 10px 30px 10px"
          >刷新列表</el-button
        >
        <!-- 排序 -->
        <el-button
          type="primary"
          @click="sortTicket"
          style="margin: 0 10px 30px 0"
          >正序倒序</el-button
        >
        <!-- 新增按钮 -->
        <el-button
          type="primary"
          style="margin: 0 10px 30px 0"
          @click="addTicket"
          >新增信息</el-button
        >
        <!--导出按钮-->
        <el-button
          type="primary"
          style="margin: 0 0 30px 0"
          @click="exportExcelSelect"
          >导出Excel</el-button
        >
      </div>
    </div>
    <!-- 编辑弹窗 -->
    <el-dialog
      :title="ticketType === 'adduser' ? '新增信息' : '编辑信息'"
      width="40%"
      :visible.sync="ticketShow"
    >
      <common-ticket :ticketForm="ticketForm"></common-ticket>
      <div slot="footer" class="dialog-footer">
        <el-button @click="ticketShow = false">取消</el-button>
        <el-button type="primary" @click="confirmTicket">确定</el-button>
      </div>
    </el-dialog>
    <!--原始表格-->
    <el-card>
      <el-table
        v-loading="loading"
        element-loading-text="拼命加载中"
        element-loading-spinner="el-icon-loading"
        element-loading-background="rgba(0, 0, 0, 0.8)"
        :data="tableData"
        style="width: 100%"
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection"> </el-table-column>
        <el-table-column prop="ticket_date" label="日期"> </el-table-column>
        <el-table-column prop="ticket_name" label="姓名"> </el-table-column>
        <el-table-column prop="ticket_year" label="年龄"> </el-table-column>
        <el-table-column prop="ticket_ip" label="电话"> </el-table-column>
        <el-table-column label="门票详细">
          <el-table-column prop="ticket_id" label="票号"> </el-table-column>
          <el-table-column prop="ticket_type" label="类型"> </el-table-column>
          <el-table-column prop="ticket_price" label="价格"> </el-table-column>
          <el-table-column prop="ticket_discount" label="优惠价格">
          </el-table-column>
          <el-table-column prop="ticket_state" label="状态">
            <template slot-scope="scope">
              <div slot="reference" class="name-wrapper">
                <el-tag
                  v-if="scope.row.ticket_state == '已购票'"
                  size="medium"
                  >{{ scope.row.ticket_state }}</el-tag
                >
                <el-tag
                  v-else-if="scope.row.ticket_state == '已退票'"
                  type="danger"
                  size="medium"
                  >{{ scope.row.ticket_state }}</el-tag
                >
                <el-tag v-else type="success" size="medium">{{
                  scope.row.ticket_state
                }}</el-tag>
              </div>
            </template>
          </el-table-column>
        </el-table-column>
        <el-table-column fixed="right" label="操作">
          <template slot-scope="scope">
            <el-button
              type="text"
              size="small"
              @click="setTicket(scope.$index, scope.row)"
              >编辑</el-button
            >
            <el-button
              style="color: red"
              type="text"
              size="small"
              @click="delTicket(scope.$index, scope.row)"
              >删除</el-button
            >
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-tag type="success" class="tag">共有 {{ pageNum }} 条数据</el-tag>
        <el-pagination
          background
          layout="prev, pager, next"
          :total="total"
          :page-size="9"
          @current-change="handleCurrentChange"
        >
        </el-pagination>
      </div>
    </el-card>
    <!--预览弹窗表格-->
    <el-dialog title="表格保存预览" width="70%" :visible.sync="selectWindow">
      <el-table :data="selectData" id="selectTable" height="380px">
        <el-table-column prop="ticket_date" label="日期"> </el-table-column>
        <el-table-column prop="ticket_name" label="姓名"> </el-table-column>
        <el-table-column prop="ticket_year" label="年龄"> </el-table-column>
        <el-table-column prop="ticket_ip" label="电话"> </el-table-column>
        <el-table-column label="门票详细">
          <el-table-column prop="ticket_id" label="票号"> </el-table-column>
          <el-table-column prop="ticket_type" label="类型"> </el-table-column>
          <el-table-column prop="ticket_price" label="价格"> </el-table-column>
          <el-table-column prop="ticket_discount" label="优惠价格">
          </el-table-column>
          <el-table-column prop="ticket_state" label="状态"> </el-table-column>
        </el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="exportExcel">确定保存</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import CommonTicket from "components/common/commonTable/CommomTicket.vue";

import htmlToExcel from "../../utils/htmlToExcel";

import {
  getTicketData,
  getAddTicket,
  getSetTicket,
  getDelTicket,
  getPageTicket,
  getSortTicket,
  getSearchTicket,
} from "network/ticket";

export default {
  inject: ["reload"],
  name: "SellTickets",
  components: {
    CommonTicket,
  },
  data() {
    return {
      loading: true,
      ticketSrc: "",
      flag: true,
      sortTp: 2,
      sortType: null,
      // 分页
      page: 1,
      total: 0,
      pageNum: 1,
      // 弹窗显示
      ticketShow: false,
      ticketType: "set",
      //表格中选中的数据
      selectData: [],
      selectWindow: false,
      //表格数据
      tableData: [],
      ticketForm: {
        ticket_id: "",
        ticket_price: "",
        ticket_discount: "",
        ticket_state: "",
        ticket_name: "",
        ticket_ip: "",
        ticket_year: "",
        ticket_date: "",
      },
    };
  },
  methods: {
    //导出
    exportExcel() {
      htmlToExcel.getExcel("#selectTable", "某公园售票数据");
    },
    //显示预览弹窗
    exportExcelSelect() {
      if (this.selectData.length < 1) {
        this.$message.error("请选择要导出的内容！");
        return false;
      }
      this.selectWindow = true;
    },
    //选中数据
    handleSelectionChange(val) {
      this.selectData = val;
    },
    // 新增
    addTicket(row) {
      this.ticketType = "adduser";
      this.ticketShow = true;
      this.ticketForm.ticket_name = "";
      this.ticketForm.ticket_year = "";
      this.ticketForm.ticket_ip = "";
      this.ticketForm.ticket_type = "";
      this.ticketForm.ticket_state = "";
    },
    // 编辑
    setTicket(index, row) {
      this.ticketType = "setuser";
      this.ticketShow = true;
      this.ticketForm.ticket_id = row.ticket_id;
      this.ticketForm.ticket_name = row.ticket_name;
      this.ticketForm.ticket_year = row.ticket_year;
      this.ticketForm.ticket_ip = row.ticket_ip;
      this.ticketForm.ticket_type = row.ticket_type;
      this.ticketForm.ticket_state = row.ticket_state;
    },
    // 确认
    confirmTicket() {
      if (this.ticketType == "adduser") {
        let addticket = {
          ticket_name: this.ticketForm.ticket_name,
          ticket_year: this.ticketForm.ticket_year,
          ticket_ip: this.ticketForm.ticket_ip,
          ticket_type: this.ticketForm.ticket_type,
          ticket_state: this.ticketForm.ticket_state,
        };
        let addTicket = this.$qs.stringify({ addticket });
        getAddTicket(addTicket).then((res) => {
          if (this.ticketType == "adduser" && res.code === 800) {
            this.ticketShow = false;
            this.$message({
              message: res.msg,
              type: "success",
            });
            this.reload();
          } else if (this.ticketType == "adduser" && res.code === -8) {
            this.$message({
              message: res.msg,
              type: "danger",
            });
          }
        });
      } else if (this.ticketType == "setuser") {
        let setticket = {
          ticket_id: this.ticketForm.ticket_id,
          ticket_name: this.ticketForm.ticket_name,
          ticket_year: this.ticketForm.ticket_year,
          ticket_ip: this.ticketForm.ticket_ip,
          ticket_type: this.ticketForm.ticket_type,
          ticket_state: this.ticketForm.ticket_state,
        };
        let setTicket = this.$qs.stringify({ setticket });
        getSetTicket(setTicket).then((res) => {
          if (this.ticketType == "setuser" && res.code === 900) {
            this.ticketShow = false;
            this.$message({
              message: res.msg,
              type: "success",
            });
            this.reload();
          } else if (this.ticketType == "setuser" && res.code === -9) {
            this.$message({
              message: res.msg,
              type: "danger",
            });
          }
        });
      }
    },
    // 删除
    delTicket(index, row) {
      this.$confirm("此操作将永久删除该条数据，是否继续?", "提示", {
        confirmButtonText: "确认",
        cancelButtonText: "取消",
        type: "warning",
      }).then((res) => {
        const ticket_id = row.ticket_id;
        getDelTicket(ticket_id).then((res) => {
          if (res.code === 1000) {
            this.$message({
              message: res.msg,
              type: "success",
            });
            this.reload();
          } else if (res.code === -10) {
            this.$message({
              message: res.msg,
              type: "danger",
            });
          }
        });
      });
    },
    // 刷新
    getTicketList() {
      this.reload();
    },
    // 分页
    handleCurrentChange(page) {
      this.page = page;
      getPageTicket(this.sortType, this.page).then((res) => {
        this.tableData = res.data.tb_ticket;
      });
    },
    // 排序
    sortTicket() {
      if (this.flag) {
        this.sortTp = 2;
        this.flag = false;
      } else {
        this.sortTp = 1;
        this.flag = true;
      }
      this.sortType = this.sortTp;
      getSortTicket(this.sortType, this.page).then((res) => {
        this.tableData = res.data.tb_ticket;
      });
    },
    // 搜索
    searchTicket() {
      getSearchTicket(this.ticketSrc).then((res) => {
        this.tableData = res.data.tb_ticket;
      });
    },
  },
  created() {
    setTimeout(() => {
      getTicketData().then((res) => {
      this.tableData = res.data.tb_ticket;
      this.total = res.totalCount;
      this.pageNum = res.totalCount;
      this.loading = false
    });
    }, 1000);
  },
};
</script>

<style lang="less" scoped>
.nav {
  display: flex;
  .inline-input {
    width: 250px;
    margin: 0 10px 0 5px;
  }
}
.pagination {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}
</style>