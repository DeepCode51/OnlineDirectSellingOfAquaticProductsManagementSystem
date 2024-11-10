package com.dao;
import com.entity.*;

import java.util.*;
public interface MjDAO {
	Mj findById(int id);
	void update(Mj mj);
}
