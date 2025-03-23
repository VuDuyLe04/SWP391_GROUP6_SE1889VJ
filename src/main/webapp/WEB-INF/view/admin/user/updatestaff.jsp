<tbody>
  <c:forEach var="bill" items="${bills.content}" varStatus="status">
    <tr>
      <td>${status.index + 1}</td>
      <td>${bill.store.name}</td>
      <td>${bill.customer.name}<br />${bill.customer.phone}</td>
      <td>${bill.formattedDate}</td>
      <td>${bill.paid}</td>
      <td>${bill.inDebt}</td>
      <td>${bill.totalBillPrice}</td>
      <td>${bill.billType}</td>
      <td>${bill.totalLiftPrice}</td>
      <td>
        <!-- action buttons -->
      </td>
    </tr>
  </c:forEach>
</tbody>
