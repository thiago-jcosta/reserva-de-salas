<?php

require_once "seguranca.php";
require_once "../controller/dashboardController.php";
$dsc = new dashboardController();


$tabela = $dsc->disciplinaMaisReservasController();



$total_horarios =   $dsc->totalHorariosController();

$total_reservas =  $dsc->totalReservasController();

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        
		<script src="js/jquery.js"></script>
   		<script src="js/jquery.datetimepicker.full.js"></script>
        <script src="js/dateformat.js"></script>
        
        <!-- <link href="css/select2.min.css" rel="stylesheet" /> -->
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css">
        
		<!-- <script src="js/select2.min.js"></script> -->
  	 <script src="js/lib.js"></script>
     
     </head>
     <title>Relatorios</title>
     <body>

<!-- menu esquerdo -->
<?php include "menu_esquerdo.php"; ?>

<!-- conteudo -->
<div class="corpo">

<h3> Total de reservas por disciplina </h3>

<table class="lista_comum" cellpadding="4" cellspacing="4">

	<tr>
    	<th></th>
    	<th width="300"> Nome </th>
    	<th > Total</th>
	</tr>

	<?= $tabela	?>

</table>

<h3> Taxa de ocupação das salas </h3>
<div id="chart_div"></div>

 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">

    
      google.load('visualization', '1.0', {'packages':['corechart']});

      
      google.setOnLoadCallback(drawChart);

      
      function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Ocupado', <?= $total_reservas ?>],
          ['Desocupado',  <?= $total_horarios ?>],
        ]);

        
        var options = {'title':'Taxa de ocupação da saça',
                       'width':500,
                       'height':500};

       
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

</div>

</body>
</html>
