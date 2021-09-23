<?php

// DB接続

$dbn ='mysql:dbname=gsacs_d03_04;charset=utf8;port=3306;host=localhost';
$user = 'root';
$pwd = '';

try {
  $pdo = new PDO($dbn, $user, $pwd);
} catch (PDOException $e) {
  echo json_encode(["db error" => "{$e->getMessage()}"]);
  exit();
}

// SQL作成&実行

$sql = "SELECT * FROM journal WHERE slip_date >= '2021-09-01' AND slip_date <= '2021-09-30'";
$stmt = $pdo->prepare($sql);
$status = $stmt->execute();

if ($status == false) {
  $error = $stmt->errorInfo();
  exit('sqlError:'.$error[2]);
} else {
  $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
  // var_dump($result);
  // exit();
  $output = "";
  foreach ($result as $record) {
    $output .= "
      <tr>
        <td>{$record["slip_date"]}</td>
        <td>{$record["l_sub"]}</td>
        <td id='text'>{$record["l_money"]}</td>
        <td>{$record["r_sub"]}</td>
        <td id='text'>{$record["r_money"]}</td>
        <td>{$record["descri"]}</td>
      </tr>
    ";
  }
}

?>

<!DOCTYPE html>
<html lang="ja">

<style>

legend{
  font-size: x-large;
}

#myTable .tablesorter-header {
	cursor: pointer;
	outline: none;
}

#myTable .tablesorter-header-inner::after { 
	content: '▼';
	font-size: 12px;
	margin-left: 5px;
}

table {
  margin-top: 10px;
  border-collapse: collapse;
  border-spacing: 0;
}

thead{
  background-color: skyblue;
}

th {
    text-align: center;
    border:solid;
    width: 5%;
}

td {
    border:solid;
    width: 5%;
    padding-left: 10px;
}

table tr td:nth-of-type(3){
  text-align: right;
  padding-right: 10px;
}

table tr td:nth-of-type(5){
  text-align: right;
  padding-right: 10px;
}

.tekiyou{
    width: 20%;
}

</style>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.1/js/jquery.tablesorter.min.js"></script>

  <title>仕訳帳</title>
</head>

<body>
  <fieldset>
    <legend>仕訳帳</legend>
    <a href="journal_input.php">入力画面</a>
    <table class="tablesorter" id="myTable">
      <thead>
        <tr>
        <th>日　付</th>
          <th>借方科目</th>
          <th>借方金額</th>
          <th>貸方科目</th>
          <th>貸方金額</th>
          <th class="tekiyou">摘　　要</th>
        </tr>
      </thead>
      <tbody>
        <!-- ここに<tr><td>deadline</td><td>todo</td><tr>の形でデータが入る -->
        <?= $output ?>
      </tbody>
    </table>
  </fieldset>

  <script>

  $(document).ready(function() { 
    $("#myTable").tablesorter();
  });

  $("#myTable").tablesorter({
    sortList: [[0, 0]]
  });

const text = document.getElementById("text").textContent; //変数textにid=textの値を代入
const numNum = parseInt(text); //変数textを整数型に変換
numNum.toLocaleString(); //変数numNumをカンマ付き表記にする

  // var shunyu = document.getElementById("inputShunyu").value.replace(/,/g, '');
  //       // 値のチェック
  //       if (shunyu == "") {
  //           alert("数値を入力してください");
  //           return false;
  //       }
  //       if (isNumber(shunyu) && shunyu > 0) {
  //           var result = calcShotoku(shunyu);
  //           var shotoku = String(result[1]).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
  //           document.getElementById("shotoku").textContent = shotoku;
  //          // 収入数値をカンマ区切りに変換
  //         document.getElementById("inputShunyu").value = String(shunyu).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
  //       } else {
  //         alert("数値を正しく入力してください");
	// 	      return false;
  //       }

  </script>

</body>

</html>