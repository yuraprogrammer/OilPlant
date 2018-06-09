package entities;

import javax.ejb.Remote;

/**
 *
 * @author yura_
 */
@Remote
public interface ApClientCardRemote {
    public int getId();
    public String getResponse();
}
