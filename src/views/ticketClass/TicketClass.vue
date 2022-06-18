<template>
  <div style="margin-top: 20px">
    <el-dialog
      :title="operateClass === 'addClass' ? '新增门票类型' : '修改门票类型'"
      :visible.sync="classShow"
    >
      <common-class-ticket
        :classTicketForm="classTicketForm"
      ></common-class-ticket>
      <div slot="footer" class="dialog-footer">
        <el-button @click="classShow = false">取消</el-button>
        <el-button type="primary" @click="handleClass">确定</el-button>
      </div>
    </el-dialog>

    <el-row :gutter="20">
      <el-col :span="8">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>记事本</span>
            <el-button style="float: right; padding: 3px 0" type="text"
              >操作</el-button
            >
          </div>
          <el-table :show-header="false" :data="todoList" style="width: 100%">
            <el-table-column width="40">
              <template #default="scope">
                <el-checkbox v-model="scope.row.status"></el-checkbox>
              </template>
            </el-table-column>
            <el-table-column>
              <template #default="scope">
                <div
                  class="todo-item"
                  :class="{
                    'todo-item-del': scope.row.status,
                  }"
                >
                  {{ scope.row.title }}
                </div>
              </template>
            </el-table-column>
            <el-table-column width="60">
              <template>
                <i class="el-icon-edit"></i>
                <i class="el-icon-delete"></i>
              </template>
            </el-table-column>
          </el-table>
        </el-card>

        <el-card>
          <el-calendar v-model="value"> </el-calendar>
        </el-card>
      </el-col>

      <el-col :span="16">
        <el-card>
          <el-button
            type="success"
            style="margin: 0 0px 30px 0"
            @click="addClassTicket"
            >新增门票信息</el-button
          >
          <el-table :data="tableData" height="682px" border style="width: 100%">
            <el-table-column prop="value" label="门票类型" width="180">
            </el-table-column>
            <el-table-column prop="price" label="价格">
            </el-table-column>
            <el-table-column prop="h_price" label="优惠价格"> </el-table-column>
            <el-table-column prop="s_time" label="起始时间"> </el-table-column>
            <el-table-column prop="d_time" label="结束时间"> </el-table-column>
            <el-table-column fixed="right" label="操作" width="200">
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  type="primary"
                  icon="el-icon-edit"
                  @click="setClass(scope.$index, scope.row)"
                  >修改</el-button
                >
                <el-button
                  size="mini"
                  type="danger"
                  icon="el-icon-delete"
                  @click="delClass(scope.$index, scope.row)"
                  >删除</el-button
                >
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import CommonClassTicket from "components/common/commonTable/CommonClassTicket.vue";
import { getClassTicketData, getAddClass,getSetClass,getDelClass } from "network/class";
export default {
  inject: ["reload"],
  name: "TicketClass",
  components: {
    CommonClassTicket,
  },
  data() {
    return {
      operateClass: "addClass",
      classShow: false,
      value: new Date(),
      tableData: [],
      todoList: [
        {
          title: "今天要修复100个bug",
          status: false,
        },
        {
          title: "今天要修复100个bug",
          status: false,
        },
        {
          title: "今天要写100行代码加几个bug吧",
          status: false,
        },
        {
          title: "今天要修复100个bug",
          status: false,
        },
        {
          title: "今天要写100行代码加几个bug吧",
          status: true,
        },
      ],
      classTicketForm: {
        id: '',
        value: "",
        price: "",
        h_price: "",
        formTime: [],
        s_time: "",
        d_time: "",
      },
    };
  },
  methods: {
    // 新增
    addClassTicket(row) {
      this.operateClass = "addClass";
      this.classShow = true;
      this.classTicketForm.value = "";
      this.classTicketForm.price = "";
      this.classTicketForm.h_price = "";
      this.classTicketForm.formTime = [];
    },
    // 编辑
    setClass(index, row) {
      this.operateClass = "setClass";
      this.classShow = true;
      this.classTicketForm.id = row.id;
      this.classTicketForm.value = row.value;
      this.classTicketForm.price = row.price;
      this.classTicketForm.h_price = row.h_price;
      this.classTicketForm.formTime = [row.s_time, row.d_time];
    },
    // 删除
    delClass(index, row) {
         this.$confirm("此操作将永久删除该门票信息数据，是否继续?", "提示", {
        confirmButtonText: "确认",
        cancelButtonText: "取消",
        type: "warning",
      }).then((res) => {
        const id = row.id;
        getDelClass(id).then((res) => {
          if (res.code === 1500) {
            this.$message({
              message: res.msg,
              type: "success",
            });
            this.reload();
          } else if (res.code === -15) {
            this.$message({
              message: res.msg,
              type: "danger",
            });
          }
        });
      });
    },
    // 确定
    handleClass() {
      if (this.operateClass == "addClass") {
        if (this.classTicketForm.formTime != null) {
          this.classTicketForm.s_time = this.classTicketForm.formTime[0];
          this.classTicketForm.d_time = this.classTicketForm.formTime[1];
        }
        let addclass = {
          value: this.classTicketForm.value,
          price: this.classTicketForm.price,
          h_price: this.classTicketForm.h_price,
          s_time: this.classTicketForm.s_time,
          d_time: this.classTicketForm.d_time,
        };
        let addClass = this.$qs.stringify({ addclass });
        getAddClass(addClass).then((res) => {
         if(this.operateClass == "addClass" && res.code === 1300){
            this.classShow = false;
            this.$message({
              message: res.msg,
              type: "success",
            });
            this.reload();
         }else if(this.operateClass == "addClass" && res.code === -13){
            this.$message({
              message: res.msg,
              type: "danger",
            });
         }
        });
      } else if (this.operateClass == "setClass") {
         if (this.classTicketForm.formTime != null) {
          this.classTicketForm.s_time = this.classTicketForm.formTime[0];
          this.classTicketForm.d_time = this.classTicketForm.formTime[1];
        }
        let setclass = {
          id: this.classTicketForm.id,
          value: this.classTicketForm.value,
          price: this.classTicketForm.price,
          h_price: this.classTicketForm.h_price,
          s_time: this.classTicketForm.s_time,
          d_time: this.classTicketForm.d_time,
        };
        let setClass = this.$qs.stringify({ setclass });
        getSetClass(setClass).then(res => {
             if (this.operateClass == "setClass" && res.code === 1400) {
            this.classShow = false;
            this.$message({
              message: res.msg,
              type: "success",
            });
            this.reload();
          } else if (this.operateClass == "setClass" && res.code === -14) {
            this.$message({
              message: res.msg,
              type: "danger",
            });
          }
        })
      }
    },
  },
  created() {
    getClassTicketData().then((res) => {
      this.tableData = res.tb_class_ticket;
    });
  },
};
</script>

<style lang="less">
.el-calendar-table .el-calendar-day {
  height: 38px;
}
.text {
  font-size: 14px;
}

.item {
  margin-bottom: 18px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}
.clearfix:after {
  clear: both;
}

.box-card {
  margin-bottom: 30px;
}
.todo-item-del {
  text-decoration: line-through;
  color: #999;
}
</style>