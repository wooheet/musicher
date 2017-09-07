package musicher.blocko.api;

import io.blocko.coinstack.*;
import io.blocko.coinstack.model.*;


public class API {
	
	public static CoinStackClient createNewCoinStackClient(){
		CoinStackClient coinstack = new CoinStackClient(new CredentialsProvider(){
			@Override
			public String getSecretKey() {
				return "c93a162e57be6f7e9d31aade0ed79e";//e3133e1a490656597be2c965a2dd6e
			}
			
			@Override
			public String getAccessKey() {
				return "fa9bd1e0daddaaa8c32e8a79c3a320";//6eb8592ed7c7b41bfc0ad13d4a51f1
			}
		}, Endpoint.MAINNET);	
		
		return coinstack;
	}
	
}


