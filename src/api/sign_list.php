<?php 
include_once('./db_park.php');


$pageSize=6; //每页数量
if (!isset($_GET['page'])) {
    $page = 1; //当前第几页
    $pageu = $page - 1;
} else {
    $page = $_GET['page'];
    $pageu = ($page - 1) * $pageSize;
}


$totalCount = mysqli_num_rows(mysqli_query($link, "select sign_id from tb_addsign")); //总数据量

$totalPageCount = ceil($totalCount / $pageSize); //总页数

if($page > $totalPageCount){
    $page = $totalPageCount;
    $pageu = ($page - 1) * $pageSize;
}

$sql="select * from tb_addsign where 1=1 order by sign_id desc  limit $pageu,$pageSize";


$query = mysqli_query($link,$sql);

$tb_addsign = [];
while($row = mysqli_fetch_assoc($query)){
    $tb_addsign[] = $row;
}

$tb_addsign = [
    'totalCount' => $totalCount,
    'totalPageCount' => $totalPageCount,
    'currentPageNo' => $page,
    'data' => [
        'tb_addsign' => $tb_addsign
    ],
    'code' => 200,
    'msg' => 'user',
];
echo(json_encode($tb_addsign));
?>