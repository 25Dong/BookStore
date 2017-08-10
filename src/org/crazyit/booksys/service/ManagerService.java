package org.crazyit.booksys.service;

import org.crazyit.booksys.domain.Manager;

public interface ManagerService {

	int login(Manager manager);

	Manager find(Manager manager);

}
