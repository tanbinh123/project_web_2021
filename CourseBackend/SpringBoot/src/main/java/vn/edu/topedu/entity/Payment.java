package vn.edu.topedu.entity;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import vn.edu.topedu.payment.vnpay.VNPayConfig;
import vn.edu.topedu.sendrequest.HttpGetUltis;
import vn.edu.topedu.utils.WebUtils;

@Entity
@Table(name = "Payment")
public class Payment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "User_Id", nullable = false)
	@JsonIgnore
	private AppUser appUser;

	@Column(name = "ip_address", length = 255, nullable = false)
	private String ipAddress;
	@Column(name = "Create_Time", nullable = false)
	private Date createTime = new Date();
	
	@Column(name = "Amount", nullable = false)
	private long amount;
	@Column(name = "currcode", nullable = false)
	private String currCode;
	
	@Column(name = "url_pay", nullable = false)
	private String urlPay;	
	
	@Column(name = "params_url_status", nullable = false)
	private String paramsUrlStatus;	
	
	@Column(name = "transaction_Status", nullable = false)
	 @Enumerated(EnumType.STRING)
	private TransactionState transactionStatus = TransactionState.UNCOMPLETE;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public AppUser getAppUser() {
		return appUser;
	}
	public void setAppUser(AppUser appUser) {
		this.appUser = appUser;
	}
	
	
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	
	public String getCurrCode() {
		return currCode;
	}
	public void setCurrCode(String currCode) {
		this.currCode = currCode;
	}
	public String getUrl(String returnUrl) throws UnsupportedEncodingException {
		//String vnp_IpAddr="119.17.249.22";
		Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", VNPayConfig.vnp_Version);
        vnp_Params.put("vnp_Command", VNPayConfig.vnp_Command);
        vnp_Params.put("vnp_TmnCode", VNPayConfig.vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(this.amount));
        vnp_Params.put("vnp_CurrCode", this.currCode);
        vnp_Params.put("vnp_IpAddr", this.ipAddress);
        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_OrderInfo", "SpringBoot");
        if(returnUrl.charAt(returnUrl.length()-1)!='/') {
        	returnUrl+="/"+this.id;
        }else {
        	returnUrl+=this.id;
        }
        vnp_Params.put("vnp_ReturnUrl", returnUrl);
        vnp_Params.put("vnp_TxnRef", String.valueOf(this.id));
        vnp_Params.put("vnp_CreateDate", WebUtils.formatDate(new Date()));
      
        
        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(fieldValue);
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
       
        String queryUrl = query.toString();
        String vnp_SecureHash = WebUtils.Sha256(VNPayConfig.vnp_HashSecret + hashData.toString());
        queryUrl += "&vnp_SecureHashType=SHA256&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = VNPayConfig.vnp_PayUrl + "?" + queryUrl;
        this.urlPay=paymentUrl;
        return paymentUrl;
	}
	@JsonIgnore
	public String querryFromVNPay() throws UnsupportedEncodingException {
		//String vnp_IpAddr="119.17.249.22";
		Map<String, String> vnp_Params = new HashMap<>();
		vnp_Params.put("vnp_Version", VNPayConfig.vnp_Version);
		vnp_Params.put("vnp_Command", "querydr");
		vnp_Params.put("vnp_TmnCode", VNPayConfig.vnp_TmnCode);
		vnp_Params.put("vnp_IpAddr", this.ipAddress);
		vnp_Params.put("vnp_OrderInfo", "Truy van luc "+WebUtils.formatDate(new Date()));
		vnp_Params.put("vnp_TxnRef", String.valueOf(this.id));
		vnp_Params.put("vnp_CreateDate", WebUtils.formatDate(new Date()));
		vnp_Params.put("vnp_TransDate", WebUtils.formatDate(this.createTime));
		List fieldNames = new ArrayList(vnp_Params.keySet());
		Collections.sort(fieldNames);
		StringBuilder hashData = new StringBuilder();
		StringBuilder query = new StringBuilder();
		Iterator itr = fieldNames.iterator();
		while (itr.hasNext()) {
			String fieldName = (String) itr.next();
			String fieldValue = (String) vnp_Params.get(fieldName);
			if ((fieldValue != null) && (fieldValue.length() > 0)) {
				//Build hash data
				hashData.append(fieldName);
				hashData.append('=');
				hashData.append(fieldValue);
				//Build query
				query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
				query.append('=');
				query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
				
				if (itr.hasNext()) {
					query.append('&');
					hashData.append('&');
				}
			}
		}
		
		String queryUrl = query.toString();
		String vnp_SecureHash = WebUtils.Sha256(VNPayConfig.vnp_HashSecret + hashData.toString());
		queryUrl += "&vnp_SecureHashType=SHA256&vnp_SecureHash=" + vnp_SecureHash;
		String paymentUrl = VNPayConfig.vnp_apiUrl + "?" + queryUrl;
		try {
			String rs=HttpGetUltis.sendGetRequest(paymentUrl);
			Pattern pattern = Pattern.compile("vnp_TransactionStatus=(\\d{2})");
			Matcher m = pattern.matcher(rs);
			if(m.find()) {
				int key =Integer.parseInt( m.group(1));
				switch (key) {
				case 1:
					this.transactionStatus=TransactionState.UNCOMPLETE;
					break;
				case 0:
					this.transactionStatus=TransactionState.COMPLETE;
					break;

				default:
					System.out.println(key);
					break;
				}
				setParamsUrlStatus(rs);
			}else {
				System.err.println("Warning Spam VNPay");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paymentUrl;
	}
	
	public TransactionState getTransactionStatus() {
		return transactionStatus;
	}
	public void setTransactionStatus(TransactionState transactionStatus) {
		this.transactionStatus = transactionStatus;
	}
	public String getUrlPay() {
		return urlPay;
	}
	public void setUrlPay(String urlPay) {
		this.urlPay = urlPay;
	}
	public String getParamsUrlStatus() {
		return paramsUrlStatus;
	}
	public void setParamsUrlStatus(String paramsUrlStatus) {
		this.paramsUrlStatus = paramsUrlStatus;
	}
	
	
	
	
	
}
