<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="product" scope="session" class="at.ac.tuwien.big.we16.ue2.model.Product"/>
<html lang="de">
<head>
    <meta charset="utf-8">
    <title>BIG Bid - Der Pate (Film)</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../styles/style.css">
</head>
<body data-decimal-separator="," data-grouping-separator=".">

<a href="#productsheadline" class="accessibility">Zum Inhalt springen</a>

<jsp:include page="header.jsp" flush="true" />
<div class="main-container">
    <jsp:include page="sidebar.jsp" flush="true" />
    <main aria-labelledby="productheadline" class="details-container">
        <div class="details-image-container">
            <img class="details-image" src="../images/<%=product.getImageName() %>" alt="Bild von <%=product.getDescription() %>">
        </div>
        <div data-product-id="<%=product.getProductID() %>" class="details-data">
            <h2 class="main-headline" id="productheadline"><%=product.getDescription() %></h2>

            <div class="auction-expired-text" style="display:none">
                <p>
                    Diese Auktion ist bereits abgelaufen.
                    Das Produkt wurde um
                    <span class="highest-bid"><%=product.getPriceString() %> &euro;</span> an
                    <span class="highest-bidder"><%=product.getHighestBidderString() %></span> verkauft.
                </p>
            </div>
            <p class="detail-time">Restzeit: <span data-end-time="<%=product.getExpirationDateString() %>"
                                                   class="detail-rest-time js-time-left"></span>
            </p>

			<%--
			<p id="demo"> Hier wird Text mit JS eingefuegt </p>
			<p class="demo2"> Hier wird auch Text mit JS eingefuegt </p>
			<button onclick="test()">click me!</button>
			--%>

            <form class="bid-form" method="post" action="/BidServlet">
                <label class="bid-form-field" id="highest-price">
                    <span class="highest-bid"><%=product.getPriceString() %> €</span>
                    <span class="highest-bidder"><%=product.getHighestBidderString() %></span>
                </label>
                <label class="accessibility" for="new-price"></label>
                <input type="number" step="0.01" min="<%=product.getPrice() %>" id="new-price" class="bid-form-field form-input"
                       name="new-price" required>
                <p class="bid-error">Es gibt bereits ein höheres Gebot oder der Kontostand ist zu niedrig.</p>
                <input type="submit" id="submit-price" class="bid-form-field button" name="submit-price" value="Bieten">
            </form>
        </div>
    </main>
</div>
<footer>
    © 2016 BIG Bid
</footer>
<script src="/scripts/jquery.js"></script>
<script src="/scripts/framework.js"></script>
<script src="/scripts/websocket.js"></script>
</body>
</html>