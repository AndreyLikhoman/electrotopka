
<?php 
if($this->registry->has('theme_options') == true) { 
	$theme_options = $this->registry->get('theme_options');
	$config = $this->registry->get('config');
	require_once( DIR_TEMPLATE.$config->get('config_template')."/lib/module.php" );
	$modules = new Modules($this->registry);
	
	$language_id = $config->get( 'config_language_id' );
	$customfooter = $theme_options->get( 'customfooter' );
	if(!isset($customfooter[$language_id])) {
		$customfooter[$language_id] = array(
			'facebook_status' => 0,
			'contact_status' => 0
		);
	}


			$grids = 3; $test = 0;  
			if($customfooter[$language_id]['contact_status'] == '1') { $test++; } 
			if($test == 1) { $grids = 25; }
			if($test == 2) { $grids = 2; }

	
	?>

	
	
	<!-- FOOTER ================================================== -->
	<footer class="footer">
        <div class="footer-links">
				<div class="container">
					<div class="col">
						<h5>По типу размещения</h5>
						<ul class="foot-links-list">
							<li><a href="/elyektrokotyel-dlya-otoplyeniya-chastnogo-doma-a19.html">Электрокотел для отопления частного дома</a></li>
							<li><a href="/elyektrichyeskiye-kotly-ekonomichnoye-ryeshyeniye-dlya-otoplyeniya-doma-a21.html">Электрокотел для отопления дома — цена</a></li>
							<li><a href="/ustanovka-elyektrichyeskih-kotlov-dlya-otoplyeniya-gorodskih-kvartir-a24.html">Электрокотел для отопления квартиры — цена</a></li>
							<li><a href="/elyektrokot-l-dlya-sauny-v-intyernyet-magazinye-elektrotopka-com-ua-a26.html">Электрокотёл для сауны/бани</a></li>
							<li><a href="/elyektrichyeskiye-kotly-dlya-otoplyeniya-dachi-a29.html">Электрические котлы для отопления дачи</a></li>
						</ul>

						<h5>По брендам и сериям</h5>
						<ul class="foot-links-list">
							<li><a href="/elyektrichyeskiye-kotly-dnyepr-a31.html">Электрические котлы «Днепр»</a></li>
							<li><a href="/elyektrichyeskiye-kotly-dlya-otoplyeniya-tyenko-a34.html">Электрические котлы для отопления Тенко</a></li>
							<li><a href="/elyektrichyeskiye-mini-kotly-otoplyeniya-a36.html">Электрические мини котлы</a></li>
							<li><a href="/vodyanyye-elyektrokotly-ekonomiya-v-otoplyenii-a39.html">Водяные электрокотлы</a></li>
						</ul>
					</div>
					<div class="col">
						<h5>Электрокотлы в Украине</h5>
						<ul class="foot-links-list">
							<li><a href="/elyektrokotly-v-zaporozh-ye-a32.html">Купить электрокотлы в Запорожье</a></li>
							<li><a href="/bytovyye-elyektrokotly-v-kiyevye-a35.html">Купить бытовые электрокотлы в Киеве</a></li>
							<li><a href="/elyektrokotly-v-krivom-rogye-a38.html">Электрокотлы в Кривом Роге</a></li>
							<li><a href="/elyektrichyeskiye-kotly-v-kiyevye-a40.html">Электрические котлы в Киеве</a></li>
							<li><a href="/elyektrichyeskiye-kotly-v-g-chyerkassy-a42.html">Электрические котлы в г.Черкассы</a></li>
							<li><a href="/elyektrichyeskiye-kotly-otoplyeniya-kupit-v-odyessye-a44.html">Электрические котлы в Одессе</a></li>
							<li><a href="/elyektrichyeskiye-kotly-kupit-v-chyernigovye-a47.html">Электрические котлы в Чернигове</a></li>
							<li><a href="/elyektrichyeskiye-kotly-v-poltavye-ot-intyernyet-magazina-elektrotopka-com-ua-a51.html">Электрические котлы в Полтаве</a></li>
							<li><a href="/elyektrokotly-v-hyersonye-v-intyernyet-magazinye-a53.html">Электрические котлы в Херосоне</a></li>
							<li><a href="/elyektrokotly-v-har-kovye-a41.html">Электрические котлы в Харькове</a></li>
							<li><a href="/elyektrichyeskiye-kotly-v-nikolayevye-a43.html">Электрические котлы в Николаеве</a></li>
							<li><a href="/elyektrichyeskiye-kotly-dlya-otoplyeniya-v-sumah-a45.html">Электрические котлы в Сумах</a></li>
							<li><a href="/elyektrokotly-v-zhitomirye-ot-intyernyet-magazina-elektrotopka-com-ua-a48.html">Электрические котлы в Житомире</a></li>
							<li><a href="/elyektrokotly-dlya-otoplyeniya-v-vinnitsye-a52.html">Электрические котлы в Виннице</a></li>
							<li><a href="/prodazha-elyektrichyeskih-kotlov-otoplyeniya-v-dnyepropyetrovskye-a54.html">Электрические котлы в Днепропетровске</a></li>
						</ul>
					</div>
					<div class="col">
						<h5>Полезные статьи</h5>
						<ul class="foot-links-list">
							<li><a href="/vybor-elyektrokotla-dlya-otoplyeniya-a33.html">Какой электрический котел выбрать для дома</a></li>
							<li><a href="/kupit-elyektrichyeskiy-kotyel-otoplyeniya-a37.html">Где купить электрокотел</a></li>
							<li><a href="/elyektrichyeskiye-otopityel-nyye-kotly-dlya-doma-ot-otyechyestvyennyh-proizvodityelyey-a58.html">Электрические отопительные котлы</a></li>
							<li><a href="/elyektrokotly-v-intyernyet-magazinye-elektrotopka-com-ua-a46.html">Электрокотлы в интернет-магазине elektrotopka</a></li>
							<li><a href="/potryeblyeniye-elyektrichyestva-elyektrokotlom-a50.html">Потребление электричества электрокотлом</a></li>
							<li><a href="/elyektrichyeskiy-kotyel-dlya-otoplyeniya-razumnoye-sochyetaniye-tsyeny-i-effyektnosti-a55.html">Продажа электрокотлов для отопления дома</a></li>
							<li><a href="/elyektrichyeskiye-kotly-dlya-otoplyeniya-doma-otzyvy-a60.html">Электрические котлы для отопления дома</a></li>
							<li><a href="/kakoy-elyektrichyeskiy-kotyel-dlya-otoplyeniya-kupit-a61.html">Какой электрический котел для отопления купить</a></li>
							<li><a href="/raschyet-moshchnosti-elyektrichyeskogo-kotla-dlya-otoplyeniya-po-ploshchadi-a56.html">Как рассчитать мощность электрокотла</a></li>
							<li><a href="/kak-sekonomit-na-kommunal-nyh-uslugah-a57.html">Экономия отопления при помощи электрокотлов</a></li>
							<li><a href="/elyektrichyeskiy-kotyel-ustroystvo-dlya-ekonomii-gaza-a59.html">Прибор для экономии газа — электрокотел</a></li>
						</ul>
					</div>
				</div>
			</div>
		
			<div class="footer-main">
				<div class="container">
					<div class="foot-row">
						<nav class="second-nav">
							<ul>
								<?php //<li><a href="/">Главная</a></li> ?>
								<li><a href="/o-kompanii-i8.html">О компании</a></li>
								<li><a href="/blog/blog.html">Новости</a></li>
								<li><a href="/kontaktnaya-informatsiya-i7.html">Контакты</a></li>
							</ul>
							<ul>
								<li><a href="/elyektrokotly-i-elyektrootoplyeniye-i9.html">Электрокотлы и электроотопление</a></li>
								<li><a href="/podbor-i-ustanovka-elyektrokotlov-i10.html">Подбор и установка</a></li>
								<li><a href="/dostavka-elyektrokotlov-po-Ukrainye-i11.html">Доставка по Украине</a></li>
							</ul>
						</nav>
						<div class="phone-block">
							<p>+38 (098) 366-04-43</p>
							<p>+38 (048) 789-27-32</p>
						</div>
						<button class="call-btn" type="button" data-toggle="modal" data-target="#callModal"></button>
						<div class="email"><a href="mailto:electrokotel@ukr.net">electrokotel@ukr.net</a></div>
						<div class="address">г. Одесса, ул. Косвенная, 55</div>
					</div>
					<!--<ul class="soc-list">
				        <li><a class="head-icon twitter" href="#"></a></li>
				        <li><a class="head-icon facebook" href="#"></a></li>
				        <li><a class="head-icon vkontakte" href="#"></a></li>
				        <li><a class="head-icon gplus" href="#"></a></li>
			      	</ul>-->
					<div class="foot-text">
						<p>Компания ООО «Электротопка» зарегистрирована решением Мингорисполкома от 01.08.2014 г. в Едином государственном регистре юр. лиц и индивидуальных предпринимателей за №192298169. Интернет-магазин Electrotopka.com.ua зарегистрирован в Торговом реестре Республики Беларусь 15.08.2014 г.</p>
						<p>&copy; electrotopka, 2015</p>
					</div>
				</div>
				
			</div>		
		
	</footer>
	
	
	
							
					
					
					
	<script type="text/javascript" src="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/js/megamenu.js"></script>
</div>

<a href="#" class="scrollup"><i class="fa fa-caret-up"></i>Top</a>
</div>
<?php } ?>

<!--MODAL-->
<div class="modal fade" id="callModal" tabindex="-1" role="dialog"  aria-hidden="true">
  <div class="modal-dialog call-wrap aj-form">
		<div class="call-form">	
			<h6>Обратный звонок</h6>
			<form>
				<div class="call-succes">
					<h6>Спасибо!</h6>
					<p>Мы перезвоним вам<br> в течение 15 минут!</p>
					<div class="call-btns">	
						<button type="button" data-dismiss="modal" class="close-btn">Закрыть</button>
					</div>
				</div>
				<div class="popup-main">
					<div class="call-row">	
					    <input type="hidden" name="theme-mes" value="Обратный звонок">
						<input type="text" name="name" placeholder="Представьтесь, пожалуйста">
						<input type="text" name="phone" placeholder="Номер телефона">
						<input type="text" name="email" placeholder="Ваш e-mail">
					</div>
					<div class="call-btns">	
						<button type="submit" class="send-call"></button>
						<button type="button" data-dismiss="modal" class="close-btn">Отмена</button>
					</div>
				</div>
			</form>
		</div>
        <button type="button" class="btn close-cross" data-dismiss="modal"></button>
  </div>
</div>


<div class="modal fade" id="respModal" tabindex="-1" role="dialog"  aria-hidden="true">
  <div class="modal-dialog call-wrap">
		<div class="call-form resp-form aj-form">	
			<h6>Оставить отзыв</h6>
			<form>
				<div class="call-succes">
					<h6>Спасибо!</h6>
					<p>После того, как отзыв пройдет<br> модерацию, он будет опубликован</p>
					<div class="call-btns">	
						<button type="button" data-dismiss="modal" class="close-btn">Закрыть</button>
					</div>
				</div>
				<div class="popup-main">
					
					<div class="call-row">	
						<input type="hidden" name="theme-mes" value="Отзыв">
						<input type="text" name="name" placeholder="Представьтесь, пожалуйста">
						<input type="text" name="email" placeholder="Ваш e-mail">
						<textarea name="resp" id="resp" cols="30" rows="10" placeholder="Отзыв"></textarea>
					</div>
					
					<label class="upload-file">
					    <input type="file" name="file_attach"/>
					    <span>Прикрепить фото</span>
					</label>

					<div class="call-btns">	
						<button type="submit" class="send-call"></button>
						<button type="button" data-dismiss="modal" class="close-btn">Отмена</button>
					</div>
				</div>
			</form>
		</div>
        <button type="button" class="btn close-cross" data-dismiss="modal"></button>
  </div>
</div>
<!--MODAL-->
<script type="text/javascript">
	var url = window.location.href;
	$('.primary-nav a[href="'+ url +'"]').parent('li').addClass('active');
</script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-61322968-1', 'auto');
  ga('send', 'pageview');

</script>


<!-- Yandex.Metrika counter -->
<script type="text/javascript">
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter29298895 = new Ya.Metrika({
                    id:29298895,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/29298895" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

</body>
</html>