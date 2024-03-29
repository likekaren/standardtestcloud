package com.karen.standardtestcloud.po;


import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * socket 线程类
 * 
 */
public class SocketThread extends Thread {
	private ServerSocket serverSocket = null;
 
	public SocketThread(ServerSocket serverScoket) {
		try {
			if (null == serverSocket) {
				//绑定和监听端口
				this.serverSocket = new ServerSocket(4700);
				System.out.println("ServerSocket服务启动！绑定端口为4700");
				System.out.println("socket start");
			}
		} catch (Exception e) {
			System.out.println("SocketThread创建socket服务出错");
			e.printStackTrace();
		}
 
	}
 
	public void run() {
		while (!this.isInterrupted()) {
			try {
				Socket socket = serverSocket.accept();
 
				if (null != socket && !socket.isClosed()) {
					// 处理接受的数据
					new SocketOperate(socket).start();
				}
				socket.setSoTimeout(30000);
 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
 
	public void closeSocketServer() {
		try {
			if (null != serverSocket && !serverSocket.isClosed()) {
				serverSocket.close();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

