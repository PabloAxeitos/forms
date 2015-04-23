<?php

include('../../public/vendor/RenderForm.php');
include('../../public/vendor/FilterForm.php');
// include('ValidateForm.php');

$userForm = include ('../Application/src/Application/Forms/UserForm.php');

$html = RenderForm($userForm, 'procesar.php');


echo $html;

