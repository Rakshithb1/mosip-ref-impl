package io.mosip.kernel.signature.constant;

/**
 * Constants for CryptoSignaure 
 * 
 * @author Uday Kumarl
 * @since 1.0.0
 *
 */
public enum SignatureErrorCode {
	REQUEST_DATA_NOT_VALID("KER-CSS-999", "Invalid request input"),
	INTERNAL_SERVER_ERROR("KER-CSS-500", "Internal server error"),
	NOT_VALID("KER-CSS-101", "Validation Unsuccessful");

	private final String errorCode;
	private final String errorMessage;

	private SignatureErrorCode(final String errorCode, final String errorMessage) {
		this.errorCode = errorCode;
		this.errorMessage = errorMessage;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

}
