package sessions;

import javax.ejb.Remote;

/**
 *
 * @author yura_
 */
@Remote
public interface ProbaSessionRemote {
    public String getServerResponse();
}
