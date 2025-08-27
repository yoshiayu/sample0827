package com.example.inquiry;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class InquiryDAO {
	private static final List<Inquiry> inquiries = Collections.synchronizedList(new ArrayList<>());

	public void addInquiry(Inquiry inquiry) {
		inquiries.add(inquiry);
	}

	public List<Inquiry> getAllInquiries() {
		return new ArrayList<>(inquiries);
	}

	public Inquiry getInquiryByIndex(int index) {
		if (index >= 0 && index < inquiries.size()) {
			return inquiries.get(index);
		}
		return null;
	}

	public boolean updateInquiryStatus(int index, String newStatu) {
		if (index >= 0 && index < inquiries.size()) {
			inquiries.get(index).setStatus(newStatu);
			return true;
		}
		return false;
	}

}
