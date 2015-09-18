// step-1
import com.google.common.collect.ImmutableSet;
import com.google.common.io.Closeables;
import com.google.inject.Module;
import org.jclouds.ContextBuilder;
import org.jclouds.openstack.nova.v2_0.NovaApi;
import org.jclouds.openstack.nova.v2_0.domain.Server;
import org.jclouds.openstack.nova.v2_0.domain.ServerCreated;
import org.jclouds.openstack.nova.v2_0.domain.Image;
import org.jclouds.openstack.nova.v2_0.domain.Flavor;
import org.jclouds.openstack.nova.v2_0.domain.KeyPair;
import org.jclouds.openstack.nova.v2_0.domain.FloatingIP;
import org.jclouds.openstack.nova.v2_0.domain.SecurityGroup;
import org.jclouds.openstack.nova.v2_0.domain.SecurityGroupRule;
import org.jclouds.openstack.nova.v2_0.domain.Ingress;
import org.jclouds.openstack.nova.v2_0.extensions.KeyPairApi;
import org.jclouds.openstack.nova.v2_0.extensions.FloatingIPApi;
import org.jclouds.openstack.nova.v2_0.extensions.SecurityGroupApi;
import org.jclouds.openstack.nova.v2_0.features.ServerApi;
import org.jclouds.openstack.nova.v2_0.features.ImageApi;
import org.jclouds.openstack.nova.v2_0.features.FlavorApi;
import org.jclouds.openstack.nova.v2_0.options.CreateServerOptions;
import org.jclouds.net.domain.IpProtocol;

import java.io.Closeable;
import java.io.IOException;
import java.util.Set;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class JCloudsNova implements Closeable {

    private final NovaApi conn;
    private final String region;

    public static void main(String[] args) throws IOException {
        JCloudsNova jcloudsNova = new JCloudsNova();
        // Data goes here, for example:
        String instanceName = "jcloudsdemo";

        try {
            // Function calls go here, for example:
            jcloudsNova.listImages();
            jcloudsNova.listFlavors();
            jcloudsNova.close();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jcloudsNova.close();
        }
    }

    public JCloudsNova() {
        String provider = "openstack-nova";
        String identity = "tenantName:userName";
        String credential = "Password";
        region = "RegionOne";

        conn = ContextBuilder.newBuilder(provider)
                .endpoint("https://keystone.dream.io:5000/v2.0/")
                .credentials(identity, credential)
                .buildApi(NovaApi.class);
    }

    public void close() throws IOException {
        Closeables.close(conn, true);
    }
// step-2

    public void listImages() {
        ImageApi imageApi = conn.getImageApi(region);

        for (Image image : imageApi.listInDetail().concat()) {
            System.out.println(" " + image);
        }
    }
// step-3

    public void listFlavors() {
        FlavorApi flavorApi = conn.getFlavorApi(region);

        for (Flavor flavor : flavorApi.listInDetail().concat()) {
            System.out.println(" " + flavor);
        }
    }
// step-4

    public String createInstance(String instanceName){
        ServerApi serverApi = conn.getServerApi(region);
        String imageId = "90d5e049-aaed-4abc-aa75-60c2b1ed6516";
// step-5
        String flavorId = "100";
// step-6

        ServerCreated ser = serverApi.create(instanceName, imageId, flavorId);

        Server server = serverApi.get(ser.getId());
        while(server.getStatus().value().equals("ACTIVE") == false) {
            try {
                Thread.sleep(1000);
            }
            catch (InterruptedException ex) {}
            server = serverApi.get(ser.getId());
        }

        System.out.println(ser.getId());

        return ser.getId();
    }
// step-7

    public void listServers() {
        ServerApi serverApi = conn.getServerApi(region);

        System.out.println("Servers in " + region);

        for (Server server : serverApi.listInDetail().concat()) {
            System.out.println("  " + server);
        }
    }
// step-8

    private boolean deleteInstance(String instanceId){
        ServerApi serverApi = conn.getServerApi(region);

        return serverApi.delete(instanceId);
    }
// step-9

    private boolean checkForKey(String keyName){
        KeyPairApi keyPairApi = conn.getKeyPairApi(region).get();
        for (KeyPair keyPair : keyPairApi.list()) {
            if (keyPair.getName().equals(keyName)) {
                return true;
            }
        }
        return false;
    }

    public void createKeyPair(String name, String path) throws IOException {
        if (checkForKey(name) == true){
            return;
        }

        KeyPairApi keypairApi = conn.getKeyPairExtensionForZone(region).get();
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(path));
            StringBuilder sb = new StringBuilder(); String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            line = sb.toString();
            keypairApi.createWithPublicKey(name, line);
        }
        catch (IOException e) {
            System.out.println("ERROR::Given file path is not valid.");
        }
        finally { br.close(); }
    }
// step-10

    public void createSecurityGroup() {
        SecurityGroupApi securityGroupApi = conn.getSecurityGroupApi(region).get();
        SecurityGroup securityGroup = securityGroupApi.createWithDescription("all-in-one", "Security group for a test application");

        Ingress http = Ingress.builder().ipProtocol(IpProtocol.TCP).fromPort(80).toPort(80).build();
        Ingress ssh = Ingress.builder().ipProtocol(IpProtocol.TCP).fromPort(22).toPort(22).build();

        securityGroupApi.createRuleAllowingCidrBlock(securityGroup.getId(), http, "0.0.0.0/0");
        securityGroupApi.createRuleAllowingCidrBlock(securityGroup.getId(), ssh, "0.0.0.0/0");
    }
// step-11
// step-12
    public String createInstance(String instanceName, String keypair, String userData) {
        ServerApi serverApi = conn.getServerApi(region);
        String flavorId = "100";
        String imageId = "90d5e049-aaed-4abc-aa75-60c2b1ed6516";

        CreateServerOptions options = CreateServerOptions.Builder.keyPairName(keypair).userData(userData.getBytes());
        ServerCreated ser = serverApi.create(instanceName, imageId, flavorId, options);

        Server server = serverApi.get(ser.getId());
        while(server.getStatus().value().equals("ACTIVE") == false) {
            try {
                Thread.sleep(1000);
            }
            catch (InterruptedException ex) {}
            server = serverApi.get(ser.getId());
        }

        return ser.getId();
    }

// step-13
    private String getFloatingIP() {
        FloatingIPApi floatingIPApi = conn.getFloatingIPExtensionForZone(region).get();

        for ( FloatingIP floatingIP : floatingIPApi.list() ) {
            if (floatingIP.getInstanceId() == null) {
                return floatingIP.getIp();
            }
        }
        return floatingIPApi.create().getIp();
    }

// step-14
    public void attachIP(String ip, String serverId) {
        FloatingIPApi floatingIPApi = conn.getFloatingIPExtensionForZone(region).get();
        floatingIPApi.addToServer(ip, serverId);
    }

// step-15
    public void notifyUserOfAppLocation(String ip) {
        System.out.println("App will be deployed to http://" + ip);
    }
}
