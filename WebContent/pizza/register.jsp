<%@page import="com.domino.vo.Branch"%>
<%@page import="com.domino.dao.LocationDao"%>
<%@page import="com.domino.vo.Location"%>
<%@page import="com.domino.dao.BranchDao"%>
<%@page import="com.domino.dao.ToppingDetailDao"%>
<%@page import="com.domino.vo.ToppingOrder"%>
<%@page import="com.domino.dao.EtcDetailDao"%>
<%@page import="com.domino.dao.SideDetailDao"%>
<%@page import="com.domino.dao.PizzaDetailDao"%>
<%@page import="com.domino.vo.Order"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@page import="com.domino.vo.EtcOrder"%>
<%@page import="com.domino.vo.SideOrder"%>
<%@page import="com.domino.vo.PizzaOrder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int userNo = loginUserNo;

	OrderDao orderDao = new OrderDao();
	// 장바구니가 있는지 확인하고 있으면 해당 장바구니를사용한다.
	Order cart = orderDao.getCartByUserNo(userNo);
	int cartNo = 0;
	if (cart == null) {
		// 현재 장바구니가 없다면 장바구니로 사용할 주문 객체를 만든다.
		// insert에 사용해야 하는 필수 정보 : 사용자번호, 매장번호 (매장번호는 register에 오기 전에 선택했어야 함)
		cart = new Order();
		
		LocationDao locationDao = new LocationDao();
		Location location = locationDao.getLocationByNo(savedLocationNo);
		
		BranchDao branchDao = new BranchDao();
		Branch branch = branchDao.getBranchByAddr(location.getAddrFirst());
		
		cart.setUserNo(userNo);
		cart.setBranchNo(branch.getNo());
		// 장바구니로 사용할 주문 정보 행을 DB에 만들고, 생성된 주문 번호를 가져온다.
				// 장바구니 생성 메소드에 생성된 장바구니의 주문번호를 반환하는 기능을 함께 만들어둔다.
		cartNo = orderDao.insertNewCart(cart);
	} else {
		// 만들어 둔 장바구니 객체가 있었다면 해당 객체에서 주문 번호를 가져온다.
		cartNo = cart.getNo();
	}
	
	
	// 이하 각 주문 정보에 따른 수행문들은 if문으로 해당 주문 정보가 있는지 확인하고 있을 때만 실행하도록 만들어둘 것.
	
	// request.getParameter 해서 받은 값에 피자 주문 정보가 있을 경우
	PizzaOrder po = new PizzaOrder();
	// request.getParameter 해서 받은 값에 사이드 주문 정보가 있을 경우
	SideOrder so = new SideOrder();
	// request.getParameter 해서 받은 값에 기타 주문 정보가 있을 경우	
	EtcOrder eo = new EtcOrder();

	// 각각의 주문정보에 장바구니의 주문 번호를 포함해 상세정보를 저장한다. (피자주문정보로 예시를 든 것. 나머지도 똑같이 해야함)
	po.setOrderNo(cartNo);
	po.setPizzaNo(pizzaNo);
	po.setPizzaSize(pizzaSize);
	po.setDoughNo(doughNo);
	po.setOrderAmount(orderAmount);
	// 할인전 주문가격도 계산해주세요(pizza 사이즈에 따른 원래 가격 + 도우 가격에 주문수량 곱하기 해서 넣어주기 !! 토핑은 계산 x)
	po.setOrderPrice(orderPrice);
	// 할인된 주문가격 (pizza 사이즈에 따른 할인가격 + 도우 가격에 주문수량 곱하기 계산해서 넣어주기 !! 토핑은 계산 x)
	po.setDiscountPrice(discountPrice);
	
	// 주문정보가 저장되었으면 주문정보객체를 DB에 저장한다.
	// 여기서도 저장된 피자주문번호를 바로 갖다 써야되기 때문에 return값으로 해당 피자주문번호를 반환해준다.
	PizzaDetailDao pizzaDetailDao = new PizzaDetailDao();
	int pizzaOrderNo = pizzaDetailDao.insertNewPizzaOrder(po);
	// 토핑주문정보가 있다면 토핑주문정보를 저장한다.
	ToppingOrder tpo = new ToppingOrder();
	// 토핑주문객체에 피자주문번호를 저장한다.
	tpo.setPizzaOrderNo(pizzaOrderNo);
	// 이하 나머지 정보들도 저장해준다.
	
	// 토핑주문정보를 db에 저장한다.
	ToppingDetailDao toppingDetailDao = new ToppingDetailDao();
	toppingDetailDao.insertNewToppingOrder(tpo);
	
	// 사이드, etc도 마찬가지로 처리해준다.
	so.setOrderNo(cartNo);
	eo.setOrderNo(cartNo);
	
	// 중간생략
	
	// 얘네들은 주문번호를 받아오지 않아도 되므로 일반적인 메소드를 사용한다.
	SideDetailDao sideDetailDao = new SideDetailDao();
	sideDetailDao.insertNewSideOrder(so);
	EtcDetailDao etcDetailDao = new EtcDetailDao();
	etcDetailDao.insertNewEtcOrder(eo);
	
	// 모든 작업이 끝나면 cart로 보내준다.
	response.sendRedirect("/domino/order/cart.jsp");
%>