<%@page import="com.domino.util.StringUtil"%>
<%@page import="com.domino.util.NumberUtil"%>
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
	if (session.getAttribute("savedLocationNo") == null) {
		response.sendRedirect("/domino/order/selectlocation.jsp?err=deny");
		return;
	}
	int locationNo = (int) session.getAttribute("savedLocationNo");
	
	OrderDao orderDao = new OrderDao();
	// 장바구니가 있는지 확인하고 있으면 해당 장바구니를사용한다.
	Order cart = orderDao.getCartByUserNo(userNo);
	int cartNo = 0;
	if (cart == null) {
		// 현재 장바구니가 없다면 장바구니로 사용할 주문 객체를 만든다.
		// insert에 사용해야 하는 필수 정보 : 사용자번호, 매장번호 (매장번호는 register에 오기 전에 선택했어야 함)
		cart = new Order();
		
		LocationDao locationDao = new LocationDao();
		Location location = locationDao.getLocationByNo(locationNo);
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
	if (request.getParameter("pizzainfo") != null) {
		String pizzaInfo = request.getParameter("pizzainfo");
		String[] pizInfos = pizzaInfo.split("\\+"); 
		int pizzaNo = NumberUtil.stringToInt(pizInfos[0]);
		String pizzaSize = pizInfos[1];
		int doughNo = NumberUtil.stringToInt(pizInfos[2]);
		int doughPrice = NumberUtil.stringToInt(pizInfos[3]);
		int orderAmount = NumberUtil.stringToInt(pizInfos[4]);
		int pizzaPrice = NumberUtil.stringToInt(pizInfos[5]);
		int pizzaDCPrice = NumberUtil.stringToInt(pizInfos[6]);
		
		PizzaOrder po = new PizzaOrder();
		// 각각의 주문정보에 장바구니의 주문 번호를 포함해 상세정보를 저장한다. (피자주문정보로 예시를 든 것. 나머지도 똑같이 해야함)
		po.setOrderNo(cartNo);
		po.setPizzaNo(pizzaNo);
		po.setPizzaSize(pizzaSize);
		po.setDoughNo(doughNo);
		po.setOrderAmount(orderAmount);
		// 할인전 주문가격도 계산해주세요(pizza 사이즈에 따른 원래 가격 + 도우 가격에 주문수량 곱하기 해서 넣어주기 !! 토핑은 계산 x)
		po.setOrderPrice((pizzaPrice + doughPrice) * orderAmount);
		// 할인된 주문가격 (pizza 사이즈에 따른 할인가격 + 도우 가격에 주문수량 곱하기 계산해서 넣어주기 !! 토핑은 계산 x)
		po.setDiscountPrice((pizzaDCPrice + doughPrice) * orderAmount);
		// 주문정보가 저장되었으면 주문정보객체를 DB에 저장한다.
		// 여기서도 저장된 피자주문번호를 바로 갖다 써야되기 때문에 return값으로 해당 피자주문번호를 반환해준다.
		PizzaDetailDao pizzaDetailDao = new PizzaDetailDao();
		int pizzaOrderNo = pizzaDetailDao.insertNewPizzaOrder(po);
		// 토핑주문정보가 있다면 토핑주문정보를 저장한다.
		
		// 토핑 주문 정보들은 배열로 올 것.
		if (request.getParameterValues("toppinginfo") != null) {
			ToppingOrder tpo = new ToppingOrder();
			ToppingDetailDao toppingDetailDao = new ToppingDetailDao();
			String[] toppingOrderInfos = request.getParameterValues("toppinginfo");
			for (String toi : toppingOrderInfos) {
				String[] infos = toi.split("\\+");
				
				int toppingNo = NumberUtil.stringToInt(infos[0]);
				int toppingOrderAmount = NumberUtil.stringToInt(infos[1]);
				int toppingPrice = NumberUtil.stringToInt(infos[2]);
				
				tpo.setToppigNo(toppingNo);
				tpo.setOrderAmount(toppingOrderAmount);
				tpo.setOrderPrice(toppingPrice * toppingOrderAmount);
				// 토핑주문객체에 피자주문번호를 저장한다.
				tpo.setPizzaOrderNo(pizzaOrderNo);
				// 토핑주문정보를 db에 저장한다.
				toppingDetailDao.insertNewToppingOrder(tpo);
			}
		}
	}

	// 사이드, etc도 마찬가지로 처리해준다.
	// 사이드, etc 주문 정보들은 배열로 올 것.
	// request.getParameter 해서 받은 값에 사이드 주문 정보가 있을 경우
	SideOrder so = new SideOrder();
	SideDetailDao sideDetailDao = new SideDetailDao();
	if (request.getParameterValues("sideinfo") != null) {
		String[] sideOrderInfos = request.getParameterValues("sideinfo");
		for (String soi : sideOrderInfos) {
			String[] infos = soi.split("\\+");
			
			int sideNo = NumberUtil.stringToInt(infos[0]);
			int sideOrderAmount = NumberUtil.stringToInt(infos[1]);
			int sidePrice = NumberUtil.stringToInt(infos[2]);
			
			so.setSideNo(sideNo);
			so.setOrderAmount(sideOrderAmount);
			so.setOrderPrice(sidePrice * sideOrderAmount);
			// 토핑주문객체에 피자주문번호를 저장한다.
			so.setOrderNo(cartNo);
			// 토핑주문정보를 db에 저장한다.
			sideDetailDao.insertNewSideOrder(so);
		}
	}
	// request.getParameter 해서 받은 값에 기타 주문 정보가 있을 경우	
	EtcOrder eo = new EtcOrder();
	EtcDetailDao etcDetailDao = new EtcDetailDao();
	if (request.getParameterValues("etcinfo") != null) {
		String[] etcOrderInfos = request.getParameterValues("etcinfo");
		for (String eoi : etcOrderInfos) {
			String[] infos = eoi.split("\\+");
			
			int etcNo = NumberUtil.stringToInt(infos[0]);
			int etcOrderAmount = NumberUtil.stringToInt(infos[1]);
			int etcPrice = NumberUtil.stringToInt(infos[2]);
			
			eo.setEtcNo(etcNo);
			eo.setOrderAmount(etcOrderAmount);
			eo.setOrderPrice(etcPrice * etcOrderAmount);
			// 토핑주문객체에 피자주문번호를 저장한다.
			eo.setOrderNo(cartNo);
			// 토핑주문정보를 db에 저장한다.
			etcDetailDao.insertNewEtcOrder(eo);
		}
	}
	
	// 모든 작업이 끝나면 cart로 보내준다.
	response.sendRedirect("/domino/order/cart.jsp");
%>