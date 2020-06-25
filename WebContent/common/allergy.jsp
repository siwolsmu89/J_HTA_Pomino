<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="modal fade pizza-nut-allergy" id="modal-allergy" style="padding:0 33px 0 0" tabindex="-1" role="dialog" aria-labelledby="myAllergyModal" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-center col-12" id="exampleAllerhyModal" >영양성분 및 알레르기 유발성분</h5>
				</div>
				<div class="modal-body">
					<div class="row ">
						<div class="col-12">
							<ul class="nav nav-tabs nav-justified" role="tablist">
				  				<li class="nav-item" role="presentation">
				    				<a class="nav-link active" id="pizza-tab" data-toggle="tab" data-target="#pizza" href="#pizza" role="tab" aria-controls="pizza" aria-selected="true">피자</a>
								</li>
								<li class="nav-item" role="presentation">
				    				<a class="nav-link" id="side-tab" data-toggle="tab" data-target="#side" href="#side" role="tab" aria-controls="side" aria-selected="true">사이드</a>
								</li>
							</ul>
							<!-- 탭 리스트 끝 -->
							<!-- 탭 컨텐츠 시작 -->
							<div class="tab-content">
								<!-- 새 상품 탭과 연관된 새 상품 컨텐츠 시작 -->
								<div class="tab-pane fade show active" id="pizza" role="tabpanel" aria-labelledby="pizza-tab">
									<div class="row mt-3">
										<div class="col-12">
											<div class="card">
												<div class="card-header">피자에 대한 정보를 확인해보세요</div>
												<div class="card-body">
													<div class="row">
														<div class="col-12">
															<p>
																한국인에게 알레르기를 유발할 수 있는 12가지 식품에 대해 아래와 같이 제품별 상세 내용을 표기하여 안내해드립니다. (괄호 안 식품이 해당 토핑에 포함되어있는 알레르기 유발가능 식품)
															</p>
															<dt>
																* 알레르기 유발 가능 식품 :
															</dt>
															<dd>
																난류(가금류에 한한다), 우유, 메밀, 땅콩, 대두, 밀, 고등어, 게, 새우, 돼지고기, 복숭아, 토마토, 아황산류, 호두, 닭고기, 쇠고기, 오징어, 조개류(굴, 전복, 홍합포함), 잣
															</dd>
															<div>
																<h5>피자</h5>
															</div>
															<div>
																<p>피자 공통: 오리지널,나폴리, 슈퍼시드함유, 샌드 도우(우유, 밀, 대두), 씬, 더블 도우(밀), 더블치즈엣지(스트링 치즈(우유, 대두, 밀), 카망베르 크림치즈(우유))</p>
															</div>
															<div>
																<table class="table small">
																<caption>피자 재료중 알레르기 유발 가능 식품</caption>
																	<colgroup>
																		<col width="7%">
																		<col width="24%">
																		<col>
																	</colgroup>
																	<thead>
																		<tr>
																			<th>NO</th>
																			<th>피자</th>
																			<th>알레르기 유발성분 표기</th>
																		</tr>
																	</thead>
																	<tbody>
																		<tr>
																			<td>1</td>
																			<td>시리얼 칠리크랩</td>
																			<td>모차렐라, 페터크림 치즈(우유), 토마토 소스(토마토, 대두), 갈릭 크림 소스(계란, 우유, 대두, 밀), 로스트 포테이토(대두), 베이컨칩(돼지고기), 호스래디시 스퀴드(오징어, 계란, 우유, 대두), 스위트 칠리크랩(게, 대두, 밀, 새우, 토마토, 닭고기, 오징어, 조개류(굴)), 오리엔탈 통새우(새우, 우유, 대두, 밀, 토마토, 닭고기, 쇠고기, 조개류(굴))</td>
																		</tr>
																		<tr>
																			<td>2</td>
																			<td>블랙타이거슈림프+직화스테이크</td>
																			<td>
																				모차렐라, 페터크림, 리코타 치즈, 로마노크림, 체더, 파르메산, 콰트로치즈퐁듀 치즈(우유),
																				로스트포테이토(대두), 호스래디시소스(계란, 우유, 대두), 리얼불고기(대두,밀,쇠고기,조개류(굴)),
																				블랙타이거 슈림프(새우), 아라비아타소스(계란,대두,밀,돼지고기,닭고기,토마토), 선드라이토마토(토마토),
																				블랙앵거스 비프(쇠고기, 대두, 밀, 계란)
																			</td>
																		</tr>
																		<tr>
																			<td>3</td>
																			<td>30치즈&뉴욕 스트립 스테이크+포테이토</td>
																			<td>갈릭 크림 소스(계란, 우유, 대두, 밀), 뉴욕 스트립 스테이크(대두, 밀, 쇠고기), 모차렐라, 프로볼로네, 체더, 크리미 고르곤졸라(우유), 15가지 믹스 슈레드 치즈(우유, 대두), 11가지 믹스 옐로우 치즈(우유, 대두, 계란), 감자(대두,이산화황), 마요네즈(난류,대두), 베이컨(돼지고기), 토마토소스, 토마토 콩피(토마토)</td>
																		</tr>
																		<tr>
																			<td>4</td>
																			<td>블랙타이거 슈림프+블랙앵거스 스테이크</td>
																			<td>모차렐라, 페터크림, 리코타 치즈, 로마노크림, 체더, 파르메산, 콰트로치즈퐁듀 치즈(우유), 로스트포테이토(대두), 호스래디시소스(계란, 우유, 대두), 리얼불고기(대두,밀,쇠고기,조개류(굴)), 블랙타이거 슈림프(새우), 아라비아타소스(계란,대두,밀,돼지고기,닭고기,토마토), 선드라이토마토(토마토), 블랙앵거스 비프(쇠고기, 대두, 밀, 계란)</td>
																		</tr>
																		<tr>
																			<td>5</td>
																			<td>30치즈&뉴욕 스트립 스테이크</td>
																			<td>갈릭 크림 소스(계란, 우유, 대두, 밀), 뉴욕 스트립 스테이크(대두, 밀, 쇠고기), 모차렐라, 프로볼로네, 체더, 크리미 고르곤졸라(우유), 15가지 믹스 슈레드 치즈(우유, 대두), 11가지 믹스 옐로우 치즈(우유, 대두, 계란), 감자(대두,이산화황), 마요네즈(난류,대두), 베이컨(돼지고기), 토마토소스, 토마토 콩피(토마토)</td>
																		</tr>
																		<tr>
																			<td>6</td>
																			<td>치즈케이크 블랙타이거</td>
																			<td>
																				파르메산,모차렐라(우유), 선드라이토마토(토마토), 베이컨칩(돼지고기), 치즈케이크무스(계란,우유), 블랙타이거 슈림프(새우), 호스래디시소스(계란, 우유, 대두)
																			</td>
																		</tr>
																		<tr>
																			<td>7</td>
																			<td>미트미트미트</td>
																			<td>
																				모차렐라, 페터크림 치즈, 체더 치즈(우유), 아라비아타소스(계란,대두,밀,돼지고기,닭고기,토마토), 리얼불고기(대두,밀,쇠고기,조개류(굴)), 비프 스테이크(대두, 밀, 토마토, 쇠고기), BBQ포크(대두, 밀, 토마토, 돼지고기, 쇠고기), 트러플크림(계란,우유,대두)
																			</td>
																		</tr>
																		<tr>
																			<td>8</td>
																			<td>핫치킨</td>
																			<td>
																				스파이시 치킨(닭고기, 토마토, 대두, 밀, 우유, 아황산류), 스파이시마요(계란,우유,대두,밀), 특제 바비큐 소스(대두, 토마토), 체더, 파르메산, 모차렐라 치즈(우유), 베이컨칩(돼지고기),
																			</td>
																		</tr>
																		<tr>
																			<td>9</td>
																			<td>리얼불고기</td>
																			<td>
																				리얼불고기(대두,밀,쇠고기,조개류(굴)), 불고기소스(우유,대두,밀,토마토,쇠고기,조개류(굴)), 체더, 모차렐라 치즈(우유)
																			</td>
																		</tr>
																		<tr>
																			<td>10</td>
																			<td>치즈가든</td>
																			<td>토마토 슬라이스(토마토), 리코타, 프로볼로네, 모차렐라 치즈(우유), 토마토소스(토마토, 대두))</td>
																		</tr>
																		<tr>
																			<td>11</td>
																			<td>문어밤 슈림프</td>
																			<td>
																				페터크림, 파르메산, 모차렐라 치즈(우유), 토마토소스(토마토, 대두), 호스래디시소스(계란, 우유, 대두), 딥치즈소스(우유, 대두), 문어(대두, 밀, 우유, 새우, 쇠고기, 조개류), 통새우(새우)
																			</td>
																		</tr>
																		<tr>
																			<td>12</td>
																			<td>베스트 콰트로</td>
																			<td>
																				모차렐라, 페터크림, 리코타, 로마노크림치즈(우유), 로스트포테이토(대두), 호스래디시소스(계란,우유,대두), 아라비아타소스(계란,대두,밀,돼지고기, 닭고기,토마토), 블랙앵거스 비프 (쇠고기,대두,밀,계란), 리얼불고기(대두,밀,쇠고기,조개류(굴)), 블랙타이거 슈림프(새우), 감자(대두,이산화황), 마요네즈(난류,대두), 베이컨(돼지고기), 불고기(쇠고기,대두,밀,아황산류), 페퍼로니(돼지고기,쇠고기), 포크(돼지고기,쇠고기,대두,밀,계란), 햄(돼지고기,쇠고기,대두,계란)
																			</td>
																		</tr>
																		<tr>
																			<td>13</td>
																			<td>더블크러스트 이베리코</td>
																			<td>
																				모차렐라, 리코타, 로마노크림치즈, 콰트로 치즈퐁듀(우유), 베이컨(돼지고기), New 고구마 무스(계란, 우유, 대두, 밀), 감자(대두,이산화황),마요네즈(난류,대두), 토마토소스(토마토, 대두), 선드라이토마토(토마토), 코코넛 허니버터 파우더(대두,밀,우유),이베리코 스테이크 (돼지고기,대두,밀)
																			</td>
																		</tr>
																		<tr>
																			<td>14</td>
																			<td>우리 고구마</td>
																			<td>
																				모차렐라, 리코타, 체더, 카망베르 크림 치즈(우유), 트러플크림(계란,우유,대두), 리얼불고기(대두,밀,쇠고기,조개류(굴)), 베이컨(돼지고기), 고구마 무스(계란, 우유, 대두, 밀)
																			</td>
																		</tr>
																		<tr>
																			<td>15</td>
																			<td>블랙앵거스 스테이크</td>
																			<td>
																				모차렐라, 페터크림, 리코타 치즈 (우유), 로스트포테이토(대두), 호스래디시소스(계란, 우유, 대두), 아라비아타소스(계란,대두,밀,돼지고기,닭고기,토마토), 선드라이토마토(토마토), 앵거스비프 (쇠고기, 대두, 밀, 계란)
																			</td>
																		</tr>
																	</tbody>
																</table>
																<table class="table small">
																	<thead>
																		<tr>
																			<th>제품명</th>
																			<th>총 중량(g)</th>
																			<th>1회분 기준</th>
																			<th>1회분
																			중량 (g)</th>
																			<th>열량
																			(kcal/1회분)</th>
																			<th>단백질
																			(g/1회분)</th>
																			<th>포화지방
																			(g/1회분)</th>
																			<th>나트륨
																			(mg/1회분)</th>
																			<th>당류
																			(g/1회분)</th>
																		</tr>
																	</thead>
																	<tbody>
																		<tr>
																			<td>시리얼 칠리크랩(오리지널L)</td>
																			<td>1100</td>
																			<td>1조각</td>
																			<td>138</td>
																			<td>303</td>
																			<td>14</td>
																			<td>4</td>
																			<td>583</td>
																			<td>6</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(오리지널M)</td>
																			<td>704</td>
																			<td>1조각</td>
																			<td>117</td>
																			<td>253</td>
																			<td>12</td>
																			<td>4</td>
																			<td>524</td>
																			<td>5</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(나폴리L)</td>
																			<td>910</td>
																			<td>1조각</td>
																			<td>114</td>
																			<td>231</td>
																			<td>12</td>
																			<td>3</td>
																			<td>530</td>
																			<td>5</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(나폴리M)</td>
																			<td>582</td>
																			<td>두조각</td>
																			<td>194</td>
																			<td>385</td>
																			<td>19</td>
																			<td>6</td>
																			<td>914</td>
																			<td>9</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(씬크러스트L)</td>
																			<td>752</td>
																			<td>2조각</td>
																			<td>188</td>
																			<td>399</td>
																			<td>21</td>
																			<td>9</td>
																			<td>919</td>
																			<td>10</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(씬크러스트M)</td>
																			<td>493</td>
																			<td>2조각</td>
																			<td>164</td>
																			<td>341</td>
																			<td>17</td>
																			<td>8</td>
																			<td>817</td>
																			<td>9</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(슈퍼시드함유도우L)</td>
																			<td>1119</td>
																			<td>1조각</td>
																			<td>140</td>
																			<td>317</td>
																			<td>15</td>
																			<td>4</td>
																			<td>613</td>
																			<td>6</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(오리지널L)</td>
																			<td>1100</td>
																			<td>1조각</td>
																			<td>138</td>
																			<td>303</td>
																			<td>14</td>
																			<td>4</td>
																			<td>583</td>
																			<td>6</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(오리지널M)</td>
																			<td>704</td>
																			<td>1조각</td>
																			<td>117</td>
																			<td>253</td>
																			<td>12</td>
																			<td>4</td>
																			<td>524</td>
																			<td>5</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(나폴리L)</td>
																			<td>910</td>
																			<td>1조각</td>
																			<td>114</td>
																			<td>231</td>
																			<td>12</td>
																			<td>3</td>
																			<td>530</td>
																			<td>5</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(나폴리M)</td>
																			<td>582</td>
																			<td>두조각</td>
																			<td>194</td>
																			<td>385</td>
																			<td>19</td>
																			<td>6</td>
																			<td>914</td>
																			<td>9</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(씬크러스트L)</td>
																			<td>752</td>
																			<td>2조각</td>
																			<td>188</td>
																			<td>399</td>
																			<td>21</td>
																			<td>9</td>
																			<td>919</td>
																			<td>10</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(씬크러스트M)</td>
																			<td>493</td>
																			<td>2조각</td>
																			<td>164</td>
																			<td>341</td>
																			<td>17</td>
																			<td>8</td>
																			<td>817</td>
																			<td>9</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(슈퍼시드함유도우L)</td>
																			<td>1119</td>
																			<td>1조각</td>
																			<td>140</td>
																			<td>317</td>
																			<td>15</td>
																			<td>4</td>
																			<td>613</td>
																			<td>6</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(오리지널L)</td>
																			<td>1100</td>
																			<td>1조각</td>
																			<td>138</td>
																			<td>303</td>
																			<td>14</td>
																			<td>4</td>
																			<td>583</td>
																			<td>6</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(오리지널M)</td>
																			<td>704</td>
																			<td>1조각</td>
																			<td>117</td>
																			<td>253</td>
																			<td>12</td>
																			<td>4</td>
																			<td>524</td>
																			<td>5</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(나폴리L)</td>
																			<td>910</td>
																			<td>1조각</td>
																			<td>114</td>
																			<td>231</td>
																			<td>12</td>
																			<td>3</td>
																			<td>530</td>
																			<td>5</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(나폴리M)</td>
																			<td>582</td>
																			<td>두조각</td>
																			<td>194</td>
																			<td>385</td>
																			<td>19</td>
																			<td>6</td>
																			<td>914</td>
																			<td>9</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(씬크러스트L)</td>
																			<td>752</td>
																			<td>2조각</td>
																			<td>188</td>
																			<td>399</td>
																			<td>21</td>
																			<td>9</td>
																			<td>919</td>
																			<td>10</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(씬크러스트M)</td>
																			<td>493</td>
																			<td>2조각</td>
																			<td>164</td>
																			<td>341</td>
																			<td>17</td>
																			<td>8</td>
																			<td>817</td>
																			<td>9</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(슈퍼시드함유도우L)</td>
																			<td>1119</td>
																			<td>1조각</td>
																			<td>140</td>
																			<td>317</td>
																			<td>15</td>
																			<td>4</td>
																			<td>613</td>
																			<td>6</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(오리지널L)</td>
																			<td>1100</td>
																			<td>1조각</td>
																			<td>138</td>
																			<td>303</td>
																			<td>14</td>
																			<td>4</td>
																			<td>583</td>
																			<td>6</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(오리지널M)</td>
																			<td>704</td>
																			<td>1조각</td>
																			<td>117</td>
																			<td>253</td>
																			<td>12</td>
																			<td>4</td>
																			<td>524</td>
																			<td>5</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(나폴리L)</td>
																			<td>910</td>
																			<td>1조각</td>
																			<td>114</td>
																			<td>231</td>
																			<td>12</td>
																			<td>3</td>
																			<td>530</td>
																			<td>5</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(나폴리M)</td>
																			<td>582</td>
																			<td>두조각</td>
																			<td>194</td>
																			<td>385</td>
																			<td>19</td>
																			<td>6</td>
																			<td>914</td>
																			<td>9</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(씬크러스트L)</td>
																			<td>752</td>
																			<td>2조각</td>
																			<td>188</td>
																			<td>399</td>
																			<td>21</td>
																			<td>9</td>
																			<td>919</td>
																			<td>10</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(씬크러스트M)</td>
																			<td>493</td>
																			<td>2조각</td>
																			<td>164</td>
																			<td>341</td>
																			<td>17</td>
																			<td>8</td>
																			<td>817</td>
																			<td>9</td>
																		</tr>
																		<tr>
																			<td>시리얼 칠리크랩(슈퍼시드함유도우L)</td>
																			<td>1119</td>
																			<td>1조각</td>
																			<td>140</td>
																			<td>317</td>
																			<td>15</td>
																			<td>4</td>
																			<td>613</td>
																			<td>6</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 새 상품 탭과 연관된 새 상품 컨텐츠 끝 -->
								<!-- 베스트 상품 탭과 연관된 베스트 상품 컨텐츠 시작 -->
								<div class="tab-pane fade" id="side" role="tabpanel" aria-labelledby="side-tab">
									<div class="row mt-3">
										<div class="col-12">
											<div class="card">
												<div class="card-header">사이드메뉴에 대한 정보를 확인해보세요.</div>
												<div class="card-body">
													<div class="row">
														<div class="col-12">
															<p>
																한국인에게 알레르기를 유발할 수 있는 12가지 식품에 대해 아래와 같이 제품별 상세 내용을 표기하여 안내해드립니다. (괄호 안 식품이 해당 토핑에 포함되어있는 알레르기 유발가능 식품)
															</p>
															<dt>* 알레르기 유발 가능 식품 :</dt>
															<dd>난류(가금류에 한한다), 우유, 메밀, 땅콩, 대두, 밀, 고등어, 게, 새우, 돼지고기, 복숭아, 토마토, 아황산류, 호두, 닭고기, 쇠고기, 오징어, 조개류(굴, 전복, 홍합포함), 잣</dd>
															<table class="table small">
																<caption>사이드디시 재료중 알레르기 유발 가능 식품</caption>
																	<colgroup>
																		<col width="7%">
																		<col width="24%">
																		<col>
																	</colgroup>
																<thead>
																	<tr>
																		<th>NO</th>
																		<th>사이드디시</th>
																		<th>알레르기 유발성분 표기</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>1</td>
																		<td>갈릭&허브윙스</td>
																		<td>닭고기,대두,밀,우유,토마토</td>
																	</tr>
																	<tr>
																		<td>2</td>
																		<td>코울슬로</td>
																		<td>계란,대두</td>
																	</tr>
																	<tr>
																		<td>3</td>
																		<td>콘샐러드</td>
																		<td>계란,대두</td>
																	</tr>
																	<tr>
																		<td>4</td>
																		<td>화이트 크림 스파게티</td>
																		<td>스파게티면(밀),크림소스(계란,우유,대두,밀,돼지고기,닭고기,조개류(굴)),베이컨(돼지고기),베이컨칩(돼지고기),모차렐라(우유)</td>
																	</tr>
																	<tr>
																		<td>5</td>
																		<td>New 치즈볼로네즈 스파게티</td>
																		<td>스파게티면(밀),볼로네즈소스(우유,대두,밀,토마토,조개류(굴),쇠고기),모차렐라(우유)</td>
																	</tr>
																	<tr>
																		<td>6</td>
																		<td>H&H(New 치볼_화이트크림)</td>
																		<td>스파게티면(밀),볼로네즈소스(우유,대두,밀,토마토,조개류(굴),쇠고기),모차렐라(우유), 크림소스(계란,우유,대두,밀,돼지고기,닭고기,조개류(굴)),베이컨(돼지고기)</td>
																	</tr>
																	<tr>
																		<td>7</td>
																		<td>트러플 크림 리조또</td>
																		<td>베이컨칩(돼지고기), 풍기크림소스(조개류(굴,바지락)), 우유, 밀, 대두), 쌀 (우유, 대두), 모차렐라치즈(우유)</td>
																	</tr>
																	<tr>
																		<td>8</td>
																		<td>슈퍼곡물 치킨</td>
																		<td>밀, 우유, 대두, 계란, 땅콩, 토마토, 닭고기, 쇠고기</td>
																	</tr>
																	<tr>
																		<td>9</td>
																		<td>펜네 파스타</td>
																		<td>펜네파스타면(밀), 크림소스(계란,우유,대두,밀,돼지고기,닭고기,조개류(굴)), 베이컨칩(돼지고기), 모차렐라, 파르메산 치즈(우유)</td>
																	</tr>
																	<tr>
																		<td>10</td>
																		<td>샐러드 가든</td>
																		<td>혼합간장(대두), 발효식초(밀), 방울 토마토, 치킨엑기스분말(닭고기)</td>
																	</tr>
																	<tr>
																		<td>11</td>
																		<td>한돈 빠에야</td>
																		<td>쌀(우유, 대두), 토마토 빠에야 소스(계란, 우유, 대두, 밀), 한돈 포크(대두, 돼지고기, 토마토, 쇠고기), 모차렐라 치즈(우유)</td>
																	</tr>
																	<tr>
																		<td>12</td>
																		<td>크리스피 핫 순살치킨</td>
																		<td>닭고기,대두,밀,쇠고기,계란</td>
																	</tr>
																</tbody>
															</table>
															<table class="table small">
																<colgroup>
																	<col width="7%">
																	<col width="24%">
																	<col>
																</colgroup>
																<thead>
																	<tr>
																		<th>NO</th>
																		<th>제품명</th>
																		<th>알레르기 유발성분 표기</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>1</td>
																		<td>갈릭 디핑 소스</td>
																		<td>계란,우유,대두</td>
																	</tr>
																	<tr>
																		<td>2</td>
																		<td>도미노 시리얼</td>
																		<td>계란,우유,대두</td>
																	</tr>
																</tbody>
															</table>
															<table class="table small">
																<thead>
																	<tr>
																		<th>제품명</th>
																		<th>총 중량(g)</th>
																		<th>열량(kcal/1회분)</th>
																		<th>단백질(g/1회분)</th>
																		<th>포화지방(g/1회분)</th>
																		<th>나트륨(mg/1회분)</th>
																		<th>당류(g/1회분)</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>크리스피 핫 순살 치킨(8조각)</td>
																		<td>127</td>
																		<td>262</td>
																		<td>25</td>
																		<td>2</td>
																		<td>966</td>
																		<td>1</td>
																	</tr>
																	<tr>
																		<td>한돈 빠에야</td>
																		<td>344</td>
																		<td>555</td>
																		<td>21</td>
																		<td>12</td>
																		<td>1742</td>
																		<td>13</td>
																	</tr>
																	<tr>
																		<td>갈릭&허브윙스(8조각)</td>
																		<td>315</td>
																		<td>595</td>
																		<td>47</td>
																		<td>9</td>
																		<td>964</td>
																		<td>3</td>
																	</tr>
																	<tr>
																		<td>샐러드 가든</td>
																		<td>141</td>
																		<td>525</td>
																		<td>2</td>
																		<td>0</td>
																		<td>301</td>
																		<td>5</td>
																	</tr>
																	<tr>
																		<td>슈퍼곡물 치킨(10조각)</td>
																		<td>178</td>
																		<td>481</td>
																		<td>36</td>
																		<td>4</td>
																		<td>1,025</td>
																		<td>4</td>
																	</tr>
																	<tr>
																		<td>트러플 리조또</td>
																		<td>285</td>
																		<td>650</td>
																		<td>17</td>
																		<td>26</td>
																		<td>1,123</td>
																		<td>8</td>
																	</tr>
																	<tr>
																		<td>펜네 파스타</td>
																		<td>366</td>
																		<td>723</td>
																		<td>25</td>
																		<td>23</td>
																		<td>1,270</td>
																		<td>8</td>
																	</tr>
																	<tr>
																		<td>프레시 코울슬로</td>
																		<td>100</td>
																		<td>133</td>
																		<td>1</td>
																		<td>4</td>
																		<td>158</td>
																		<td>9</td>
																	</tr>
																	<tr>
																		<td>프레시 콘샐러드</td>
																		<td>100</td>
																		<td>135</td>
																		<td>2</td>
																		<td>4</td>
																		<td>315</td>
																		<td>11</td>
																	</tr>
																	<tr>
																		<td>하프&하프 스파게티 (NEW 치즈 & 화이트 크림)</td>
																		<td>395</td>
																		<td>705</td>
																		<td>28</td>
																		<td>18</td>
																		<td>1,347</td>
																		<td>11</td>
																	</tr>
																	<tr>
																		<td>화이트 크림 스파게티</td>
																		<td>392</td>
																		<td>851</td>
																		<td>29</td>
																		<td>29</td>
																		<td>1,258</td>
																		<td>9</td>
																	</tr>
																	<tr>
																		<td>NEW 치즈 볼로네즈 스파게티</td>
																		<td>399</td>
																		<td>599</td>
																		<td>27</td>
																		<td>7</td>
																		<td>1,444</td>
																		<td>13</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>